// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class LId extends L {
  LId([String locale = 'id']) : super(locale);

  @override
  String weekN(int week) {
    return 'Minggu ke-$week';
  }

  @override
  String get appTitle => 'Bayiku';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpan';

  @override
  String get delete => 'Hapus';

  @override
  String get add => 'Tambah';

  @override
  String get deleteAll => 'Hapus semua';

  @override
  String get saved => 'Tersimpan';

  @override
  String get swipeToDelete => 'Geser ke kiri untuk menghapus.';

  @override
  String get history => 'Riwayat';

  @override
  String get start => 'Mulai';

  @override
  String weekAxis(int week) {
    return 'mg $week';
  }

  @override
  String get welcomeTitle => 'Selamat datang';

  @override
  String get welcomeSubtitle =>
      'Kami butuh beberapa info untuk menemani kehamilan Bunda minggu demi minggu.';

  @override
  String get babyName => 'Nama bayi';

  @override
  String get sexLabel => 'Jenis kelamin';

  @override
  String get sexGirl => 'Perempuan';

  @override
  String get sexBoy => 'Laki-laki';

  @override
  String get sexUnknown => 'Belum diketahui';

  @override
  String get kinLabel => 'Hubungan dengan bayi';

  @override
  String get kinMother => 'Ibu';

  @override
  String get kinFather => 'Ayah';

  @override
  String get kinAuntMaternal => 'Bibi (dari ibu)';

  @override
  String get kinAuntPaternal => 'Bibi (dari ayah)';

  @override
  String get kinUncleMaternal => 'Paman (dari ibu)';

  @override
  String get kinUnclePaternal => 'Paman (dari ayah)';

  @override
  String get kinSibling => 'Kakak';

  @override
  String get kinGrandmother => 'Nenek';

  @override
  String get kinGrandfather => 'Kakek';

  @override
  String get kinOther => 'Kerabat';

  @override
  String get whichDate => 'Tanggal mana yang Bunda tahu?';

  @override
  String get lastPeriod => 'Haid terakhir';

  @override
  String get dueDateShort => 'Perkiraan lahir';

  @override
  String get lastPeriodLong => 'Hari pertama haid terakhir';

  @override
  String get dueDateLong => 'Hari perkiraan lahir';

  @override
  String get tapToSelect => 'Ketuk untuk memilih';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Perkiraan lahir: $date · minggu ke-$week, hari ke-$day';
  }

  @override
  String get begin => 'Mulai';

  @override
  String get nameRequired => 'Tulis nama (atau panggilan) untuk bayi Bunda.';

  @override
  String get dateRequired => 'Pilih tanggalnya.';

  @override
  String get settings => 'Pengaturan';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSystem => 'Bahasa ponsel';

  @override
  String get privacyOptions => 'Opsi privasi iklan';

  @override
  String get factoryReset => 'Hapus semua data';

  @override
  String get factoryResetTitle => 'Hapus semua data';

  @override
  String get factoryResetMessage =>
      'Semua data berat badan, obat, penghitung, daftar, dan foto akan dihapus. Yakin?';

  @override
  String weekDay(int week, int day) {
    return 'Minggu ke-$week, hari ke-$day';
  }

  @override
  String trimester(int n) {
    return 'Trimester $n';
  }

  @override
  String get daysPassed => 'hari berlalu';

  @override
  String get daysLeft => 'hari lagi';

  @override
  String get dueDate => 'perkiraan lahir';

  @override
  String get babyToday => 'Bayiku hari ini';

  @override
  String get motherToday => 'Bunda hari ini';

  @override
  String dailyBabyTitle(int week) {
    return 'Bayiku · minggu ke-$week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Bunda · minggu ke-$week';
  }

  @override
  String get noInfoToday => 'Belum ada info untuk hari ini.';

  @override
  String get ringBirth => 'Menuju lahir';

  @override
  String get ringTests => 'Tes';

  @override
  String get ringNeeds => 'Perlengkapan';

  @override
  String get ringBag => 'Tas';

  @override
  String get weightChange => 'Perubahan berat';

  @override
  String get tools => 'Alat';

  @override
  String get toolWeight => 'Berat Badan';

  @override
  String get toolMedicine => 'Pengingat Obat';

  @override
  String get toolKick => 'Hitung Tendangan';

  @override
  String get toolContraction => 'Kontraksi';

  @override
  String get toolNeeds => 'Perlengkapan Bayi';

  @override
  String get toolBag => 'Tas Bersalin';

  @override
  String get toolTests => 'Tes Kesehatan';

  @override
  String get toolNames => 'Cari Nama';

  @override
  String get toolAlbum => 'Album Foto';

  @override
  String get suggest => 'Kirim saran';

  @override
  String get rate => 'Beri nilai';

  @override
  String get emailError => 'Aplikasi email tidak bisa dibuka.';

  @override
  String get suggestSubject => 'Saran untuk aplikasi Bayiku';

  @override
  String get suggestBody => 'Saran Anda:';

  @override
  String get weightStart => 'Berat awal Bunda';

  @override
  String get weightToday => 'Berat Bunda hari ini';

  @override
  String get weightHint => 'mis. 62,5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => 'Tambah berat';

  @override
  String get weightClearTitle => 'Data berat badan';

  @override
  String get weightClearMessage => 'Semua catatan berat badan akan dihapus.';

  @override
  String get weightEmpty =>
      'Belum ada catatan. Masukkan berat awal untuk mulai mencatat.';

  @override
  String totalChange(String value) {
    return 'Total perubahan: $value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'Minggu ke-$week · $date';
  }

  @override
  String get medAdd => 'Tambah obat';

  @override
  String get medEmpty =>
      'Tambahkan obat Bunda; kami akan mengingatkan setiap hari pada jam yang dipilih.';

  @override
  String get medNew => 'Obat baru';

  @override
  String get medEdit => 'Ubah obat';

  @override
  String get medName => 'Nama obat';

  @override
  String get medTime => 'Jam';

  @override
  String get medReminderOn => 'Pengingat aktif';

  @override
  String medDaily(String time, String meal) {
    return 'Setiap hari $time · $meal';
  }

  @override
  String get mealEmpty => 'Sebelum makan';

  @override
  String get mealFull => 'Sesudah makan';

  @override
  String get mealAny => 'Kapan saja';

  @override
  String notifTitle(String name) {
    return 'Obat: $name';
  }

  @override
  String get notifEmpty => 'Jangan lupa minum sebelum makan';

  @override
  String get notifFull => 'Jangan lupa minum sesudah makan';

  @override
  String get notifAny => 'Waktunya minum obat';

  @override
  String get notifChannel => 'Pengingat obat';

  @override
  String get notifChannelDesc => 'Pengingat pada jam minum obat';

  @override
  String get notifPermissionDenied =>
      'Izin notifikasi ditolak; pengingat tidak akan berbunyi.';

  @override
  String get kickIdle => 'tendangan';

  @override
  String get kickTap => 'TENDANG!';

  @override
  String get stopAndSave => 'Selesai dan simpan';

  @override
  String get kickHelp =>
      'Ketuk lingkaran setiap kali bayi bergerak. Panduan umum: 10 gerakan dalam 2 jam. Jika khawatir, konsultasikan dengan dokter.';

  @override
  String get kickEmpty => 'Belum ada sesi tersimpan.';

  @override
  String kickRow(int count, String duration) {
    return '$count tendangan · $duration';
  }

  @override
  String get contractionRunning => 'Kontraksi berlangsung';

  @override
  String get contractionIdle => 'Ketuk saat kontraksi dimulai';

  @override
  String get contractionStartBtn => 'MULAI';

  @override
  String get contractionStopBtn => 'SELESAI';

  @override
  String get contractionHelp =>
      'Jika kontraksi teratur dan makin sering (mis. tiap 5 menit, selama 1 menit), hubungi dokter atau bidan.';

  @override
  String get contractionEmpty => 'Belum ada kontraksi tersimpan.';

  @override
  String contractionDuration(String duration) {
    return 'Durasi $duration';
  }

  @override
  String contractionGap(String duration) {
    return 'jarak dari sebelumnya $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return '1 jam terakhir: $count kontraksi · rata-rata $length, setiap $minutes menit';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total selesai';
  }

  @override
  String get addItem => 'Tambah item';

  @override
  String get newItem => 'Item baru';

  @override
  String get customGroup => 'Item saya';

  @override
  String get testsDisclaimer =>
      'Daftar ini hanya informasi umum; tanyakan jadwal pemeriksaan Bunda kepada dokter.';

  @override
  String get namesTitle => 'Nama Bayiku';

  @override
  String get spinning => 'Roda berputar…';

  @override
  String get namesHint => 'Ketuk roda atau goyangkan ponsel';

  @override
  String get nameError => 'Nama tidak bisa didapat.';

  @override
  String get shareAll => 'Bagikan semua';

  @override
  String get ultrasoundPhoto => 'Foto USG';

  @override
  String get takePhoto => 'Ambil foto';

  @override
  String get pickGallery => 'Pilih dari galeri';

  @override
  String get share => 'Bagikan';

  @override
  String get remove => 'Hapus';

  @override
  String get photoError => 'Foto tidak bisa diambil. Periksa izin aplikasi.';

  @override
  String get addPhotosFirst => 'Tambahkan foto ke album terlebih dahulu.';

  @override
  String photoN(int n) {
    return 'Foto $n';
  }

  @override
  String get shareText => 'Foto USG bayiku';

  @override
  String get shareAllText => 'Album USG bayiku';

  @override
  String get chartBaby => 'Bayi (perkiraan)';

  @override
  String get chartMother => 'Bunda';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return 'Perkiraan berat bayi: $value';
  }

  @override
  String get babyWeightTooEarly => 'Berat bayi ditampilkan mulai minggu ke-8.';

  @override
  String get babyWeightNote =>
      'Ini nilai rata-rata; setiap bayi tumbuh berbeda. Tanyakan dokter Anda.';

  @override
  String get babyBornQuestion => 'Apakah bayi Bunda sudah lahir? 🎉';

  @override
  String get babyBornAction => 'Bayiku sudah lahir';

  @override
  String get babyBornTitle => 'Selamat datang, si kecil!';

  @override
  String get birthDateLabel => 'Tanggal lahir';

  @override
  String get birthWeight => 'Berat lahir (kg)';

  @override
  String get birthLength => 'Panjang lahir (cm)';

  @override
  String get optional => 'opsional';

  @override
  String get backToPregnancy => 'Kembali ke mode kehamilan';

  @override
  String get weeklyNotifSetting => 'Notifikasi mingguan';

  @override
  String get weeklyNotifChannel => 'Info mingguan';

  @override
  String weeklyNotifTitle(int week) {
    return 'Selamat datang di minggu ke-$week 💕';
  }

  @override
  String get weeklyNotifBody => 'Info minggu ini sudah siap.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name sudah $month bulan! 🎉';
  }

  @override
  String get monthlyNotifBody => 'Lihat perkembangan bulan ini.';

  @override
  String babyAge(int months, int days) {
    return '$months bln $days hr';
  }

  @override
  String monthTitle(int month) {
    return 'Perkembangan bulan ke-$month';
  }

  @override
  String get newbornTitle => 'Masa bayi baru lahir';

  @override
  String get showMore => 'Baca selengkapnya';

  @override
  String get lastFeeding => 'menyusu terakhir';

  @override
  String get diapersToday => 'popok hari ini';

  @override
  String get sleepToday => 'tidur hari ini';

  @override
  String agoHM(int h, int m) {
    return '$h j $m mnt lalu';
  }

  @override
  String agoM(int m) {
    return '$m mnt lalu';
  }

  @override
  String durationHM(int h, int m) {
    return '$h j $m mnt';
  }

  @override
  String get toolFeeding => 'Menyusui';

  @override
  String get toolDiaper => 'Popok';

  @override
  String get toolSleep => 'Tidur';

  @override
  String get toolGrowth => 'Pertumbuhan';

  @override
  String get breastLeft => 'Kiri';

  @override
  String get breastRight => 'Kanan';

  @override
  String get bottle => 'Botol';

  @override
  String get solid => 'MPASI';

  @override
  String get tapToStop => 'Ketuk sisi yang sama lagi untuk selesai';

  @override
  String get bottleAmount => 'Jumlah susu botol';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => 'Hari ini';

  @override
  String feedCount(int count) {
    return '$count kali menyusu';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Menyusui $minutes mnt';
  }

  @override
  String bottleTotal(int ml) {
    return 'Botol $ml ml';
  }

  @override
  String get diaperWet => 'Basah';

  @override
  String get diaperDirty => 'Kotor';

  @override
  String get diaperBoth => 'Keduanya';

  @override
  String diaperCount(int count) {
    return '$count popok';
  }

  @override
  String get sleepStart => 'Tertidur';

  @override
  String get sleepStop => 'Bangun';

  @override
  String get sleepRunning => 'Sedang tidur';

  @override
  String sleepTotal(String duration) {
    return 'Total hari ini $duration';
  }

  @override
  String get growthAdd => 'Tambah pengukuran';

  @override
  String get growthWeight => 'Berat (kg)';

  @override
  String get growthLength => 'Panjang (cm)';

  @override
  String get growthHead => 'Lingkar kepala (cm)';

  @override
  String get growthHeadShort => 'Kepala';

  @override
  String get growthEmpty =>
      'Belum ada pengukuran. Tambahkan nilai dari pemeriksaan.';

  @override
  String get whoMedian => 'Rata-rata WHO';

  @override
  String get babyWeightLabel => 'Berat bayi';

  @override
  String monthAxis(int month) {
    return '$month bln';
  }

  @override
  String get otherTools => 'Alat lainnya';

  @override
  String get noRecords => 'Belum ada catatan.';

  @override
  String get dailyMsgSetting => 'Pesan selamat pagi';

  @override
  String get premiumTitle => 'Hapus iklan';

  @override
  String get premiumDesc =>
      'Gunakan aplikasi tanpa iklan dengan sekali bayar. Pembelian ini juga berlaku di perangkat lain dengan akun toko yang sama.';

  @override
  String premiumBuy(String price) {
    return 'Bebas iklan – $price';
  }

  @override
  String get premiumBuyNoPrice => 'Toko sedang tidak tersedia';

  @override
  String get premiumRestore => 'Pulihkan pembelian';

  @override
  String get premiumActive =>
      'Versi bebas iklan aktif. Terima kasih atas dukunganmu 💕';

  @override
  String get premiumUnavailable =>
      'Pembelian tidak dapat diselesaikan. Coba lagi nanti.';

  @override
  String get premiumThanks =>
      'Terima kasih! Kamu tidak akan melihat iklan lagi 💕';
}
