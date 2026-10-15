# Bebeğim — Flutter sürümü

Eski Android (Java) uygulamasının Android + iOS için Flutter'a çevrilmiş hâli.

- Paket / Bundle ID: `com.ilbarsseckinapp.bebegim`. Eski `com.ilbarsseckinapp.mother` Play'de askıda olduğu için kullanılmadı.
- Veriler cihazda tutulur (SQLite + SharedPreferences). Hesap ya da sunucu yok.
- Günlük "Bebeğim / Anne bugün" metinleri (280 gün) ve kız/erkek isim listeleri eski Firebase veritabanından
  (mother-e387b) dışa aktarılıp `assets/content.json` dosyasına gömüldü. İnternet ve Firebase gerekmez.
- Reklam: `lib/services/ads.dart` (banner + ara sıra geçiş reklamı, GDPR onayı, iOS ATT). Debug'da Google test reklamları;
  release'de AdMob birim kimlikleri girilene kadar reklam istenmez. Manifest/Info.plist'teki AdMob uygulama kimliği şimdilik Google örneği.

## Ekranlar

| Eski Java ekranı | Flutter |
|---|---|
| SplashScreen + CreateUser | `profile_screen.dart` (ilk açılış) |
| MainActivity | `home_screen.dart` |
| Options_Settings | `profile_screen.dart` (Ayarlar, fabrika ayarları) |
| Options_KgFollow | `weight_screen.dart` |
| Options_MedicinaFollow + AlarmBroadcast | `medicine_screen.dart` + `services/notifications.dart` (her gün yerel bildirim) |
| Options_TekmeSayar | `kick_screen.dart` |
| Options_KasilmaSayar | `contraction_screen.dart` |
| Options_IhtiyacListesi / DogumCantasi / Healt_Test | `checklist_screen.dart` |
| Options_RandomName | `names_screen.dart` (dokun veya salla) |
| Options_PhotoAlbum | `album_screen.dart` |

Kaldırılanlar: FCM push bildirimleri (eski Firebase yapılandırması gerekiyordu), açılış videosu ve büyük GIF'ler.

## Android

```
flutter build appbundle --release
```

Çıktı: `build/app/outputs/bundle/release/app-release.aab`

İmza: `android/key.properties` (git'e girmez) oluşturun:

```
storeFile=C:/Users/seckin/Documents/bebegimkey/bebegim.jks
storePassword=...
keyAlias=bebegim
keyPassword=...
```

Yeni anahtar üretmek için:

```
keytool -genkey -v -keystore C:/Users/seckin/Documents/bebegimkey/bebegim.jks -keyalg RSA -keysize 2048 -validity 10000 -alias bebegim
```

`key.properties` yoksa release derlemesi debug anahtarıyla imzalanır (Play kabul etmez, sadece test için).

## iOS (Mac gerekmez)

GitHub Actions → **iOS → TestFlight** → Run workflow (`.github/workflows/ios-testflight.yml`).
Falcı Gözü'ndeki secret'ların aynısı bu repoya da eklenmeli:
`ASC_KEY_ID`, `ASC_ISSUER_ID`, `ASC_KEY_P8`, `APPLE_TEAM_ID`, `CERTIFICATE_PRIVATE_KEY`.

İlk çalıştırmadan önce App Store Connect'te `com.ilbarsseckinapp.bebegim` bundle ID'siyle bir uygulama kaydı oluşturun.

## Simge

`assets/icon/app_icon_full.png` dosyasından üretilir: `dart run flutter_launcher_icons`
