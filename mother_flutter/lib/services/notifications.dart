import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/content.dart';
import '../data/db.dart';
import '../data/profile.dart';
import '../l10n/app_localizations.dart';
import '../l10n/labels.dart';
import '../l10n/language.dart';

/// İlaç hatırlatıcıları: her ilaç için her gün aynı saatte yerel bildirim.
class Notifications {
  Notifications._();
  static final _plugin = FlutterLocalNotificationsPlugin();
  static bool _ready = false;

  static L get _l => lookupL(LanguageController.instance.locale);

  static NotificationDetails get _details => NotificationDetails(
        android: AndroidNotificationDetails(
          'ilac_hatirlatici',
          _l.notifChannel,
          channelDescription: _l.notifChannelDesc,
          importance: Importance.high,
          priority: Priority.high,
          icon: 'ic_notification',
        ),
        iOS: const DarwinNotificationDetails(presentAlert: true, presentSound: true),
      );

  static Future<void> init() async {
    if (_ready) return;
    tzdata.initializeTimeZones();
    try {
      final info = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(info.identifier));
    } catch (_) {
      tz.setLocalLocation(tz.getLocation('Europe/Istanbul'));
    }
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('ic_notification'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
    );
    _ready = true;
  }

  static Future<bool> requestPermission() async {
    await init();
    if (Platform.isAndroid) {
      final android = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      return await android?.requestNotificationsPermission() ?? true;
    }
    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    return await ios?.requestPermissions(alert: true, sound: true) ?? false;
  }

  static Future<void> schedule(Medicine m) async {
    await init();
    await cancel(m.id!);
    if (!m.active) return;
    final now = tz.TZDateTime.now(tz.local);
    var at = tz.TZDateTime(tz.local, now.year, now.month, now.day, m.hour, m.minute);
    if (!at.isAfter(now)) at = at.add(const Duration(days: 1));
    await _plugin.zonedSchedule(
      id: m.id!,
      title: _l.notifTitle(m.name),
      body: _l.mealReminder(m.meal),
      scheduledDate: at,
      notificationDetails: _details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> cancel(int id) async {
    await init();
    await _plugin.cancel(id: id);
  }

  /// Dil değişince hatırlatıcıların metni de yenilenir.
  static Future<void> rescheduleAll() async {
    for (final m in await MedicineRepo.all()) {
      await schedule(m);
    }
  }

  static Future<void> cancelAll() async {
    await init();
    await _plugin.cancelAll();
  }

  // ---- Haftalık (hamilelik) ve aylık (doğum sonrası) bilgilendirme ----

  static const _milestoneBase = 20000;
  static final milestonesEnabled = ValueNotifier<bool>(true);
  static final dailyEnabled = ValueNotifier<bool>(true);
  static const _dailyBase = 30000;

  static NotificationDetails get _milestoneDetails => NotificationDetails(
        android: AndroidNotificationDetails(
          'haftalik_bilgi',
          _l.weeklyNotifChannel,
          importance: Importance.defaultImportance,
          icon: 'ic_notification',
        ),
        iOS: const DarwinNotificationDetails(presentAlert: true),
      );

  static Future<void> loadSettings() async {
    final p = await SharedPreferences.getInstance();
    milestonesEnabled.value = p.getBool('milestones') ?? true;
    dailyEnabled.value = p.getBool('dailyMsgs') ?? true;
  }

  static Future<void> setMilestonesEnabled(bool on) async {
    final p = await SharedPreferences.getInstance();
    await p.setBool('milestones', on);
    milestonesEnabled.value = on;
    if (on) await requestPermission();
    await scheduleMilestones();
  }

  /// Bildirim iznini uygulamanın ilk kullanımında bir kez sorar.
  static Future<void> askOnce() async {
    final p = await SharedPreferences.getInstance();
    if (p.getBool('askedNotif') ?? false) return;
    await p.setBool('askedNotif', true);
    await requestPermission();
  }

  /// Hamilelikte her yeni haftanın ilk günü, doğumdan sonra her ay dönümünde
  /// saat 10:00'da bildirim. Profil, dil veya ayar değişince yeniden kurulur.
  static Future<void> scheduleMilestones() async {
    await init();
    for (var i = 0; i <= 160; i++) {
      await _plugin.cancel(id: _milestoneBase + i);
    }
    final profile = await Profile.load();
    if (profile == null) return;
    await _scheduleDaily(profile);
    if (!milestonesEnabled.value) return;
    final now = tz.TZDateTime.now(tz.local);
    final l = _l;
    // iOS en fazla 64 bekleyen bildirime izin verir; ileriye dönük sınırlı sayıda kurulur.
    var count = 0;
    if (!profile.isBorn) {
      final start = profile.dueDate.subtract(const Duration(days: 280));
      for (var week = 1; week <= 42 && count < 20; week++) {
        final day = start.add(Duration(days: week * 7));
        final at = tz.TZDateTime(tz.local, day.year, day.month, day.day, 10);
        if (!at.isAfter(now)) continue;
        await _plugin.zonedSchedule(
          id: _milestoneBase + week,
          title: l.weeklyNotifTitle(week),
          body: AppContent.current.babySize(week) ?? l.weeklyNotifBody,
          scheduledDate: at,
          notificationDetails: _milestoneDetails,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
        count++;
      }
    } else {
      final b = profile.birthDate!;
      for (var month = 1; month <= 24 && count < 12; month++) {
        final at = tz.TZDateTime(tz.local, b.year, b.month + month, b.day, 10);
        if (!at.isAfter(now)) continue;
        await _plugin.zonedSchedule(
          id: _milestoneBase + 100 + month,
          title: l.monthlyNotifTitle(profile.babyName, month),
          body: l.monthlyNotifBody,
          scheduledDate: at,
          notificationDetails: _milestoneDetails,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
        count++;
      }
    }
  }

  static Future<void> setDailyEnabled(bool on) async {
    final p = await SharedPreferences.getInstance();
    await p.setBool('dailyMsgs', on);
    dailyEnabled.value = on;
    if (on) await requestPermission();
    await scheduleMilestones();
  }

  /// Önümüzdeki 25 gün için her sabah 09:00'da kişiye hitap eden kısa mesaj.
  /// Uygulama her açıldığında pencere ileri kaydırılır.
  static Future<void> _scheduleDaily(Profile profile) async {
    for (var i = 0; i < 30; i++) {
      await _plugin.cancel(id: _dailyBase + i);
    }
    if (!dailyEnabled.value) return;
    final c = AppContent.current;
    final title = c.greeting(profile.kin);
    final now = tz.TZDateTime.now(tz.local);
    for (var i = 0; i < 25; i++) {
      final day = now.add(Duration(days: i));
      final at = tz.TZDateTime(tz.local, day.year, day.month, day.day, 9);
      if (!at.isAfter(now)) continue;
      final dayNumber = DateTime.utc(day.year, day.month, day.day).millisecondsSinceEpoch ~/ 86400000;
      final body = c.dailyMessage(born: profile.isBorn, day: dayNumber, babyName: profile.babyName);
      if (body == null) return;
      await _plugin.zonedSchedule(
        id: _dailyBase + i,
        title: title,
        body: body,
        scheduledDate: at,
        notificationDetails: _milestoneDetails,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      );
    }
  }}
