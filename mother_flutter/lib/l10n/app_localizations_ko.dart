// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class LKo extends L {
  LKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '마이 베이비';

  @override
  String get cancel => '취소';

  @override
  String get save => '저장';

  @override
  String get delete => '삭제';

  @override
  String get add => '추가';

  @override
  String get deleteAll => '모두 삭제';

  @override
  String get saved => '저장됨';

  @override
  String get swipeToDelete => '왼쪽으로 밀어서 삭제하세요.';

  @override
  String get history => '기록';

  @override
  String get start => '시작';

  @override
  String weekAxis(int week) {
    return '$week주';
  }

  @override
  String get welcomeTitle => '환영합니다';

  @override
  String get welcomeSubtitle => '임신 과정을 주차별로 함께하기 위해 몇 가지 정보가 필요해요.';

  @override
  String get babyName => '아기 이름';

  @override
  String get sexLabel => '성별';

  @override
  String get sexGirl => '딸';

  @override
  String get sexBoy => '아들';

  @override
  String get sexUnknown => '아직 모름';

  @override
  String get kinLabel => '아기와의 관계';

  @override
  String get kinMother => '엄마';

  @override
  String get kinFather => '아빠';

  @override
  String get kinAuntMaternal => '이모';

  @override
  String get kinAuntPaternal => '고모';

  @override
  String get kinUncleMaternal => '외삼촌';

  @override
  String get kinUnclePaternal => '삼촌';

  @override
  String get kinSibling => '형제자매';

  @override
  String get kinGrandmother => '할머니';

  @override
  String get kinGrandfather => '할아버지';

  @override
  String get kinOther => '친척';

  @override
  String get whichDate => '어떤 날짜를 알고 계신가요?';

  @override
  String get lastPeriod => '마지막 생리';

  @override
  String get dueDateShort => '출산 예정일';

  @override
  String get lastPeriodLong => '마지막 생리 시작일';

  @override
  String get dueDateLong => '출산 예정일';

  @override
  String get tapToSelect => '탭하여 선택';

  @override
  String profilePreview(String date, int week, int day) {
    return '출산 예정일: $date · $week주 $day일';
  }

  @override
  String get begin => '시작하기';

  @override
  String get nameRequired => '아기 이름(또는 태명)을 입력해 주세요.';

  @override
  String get dateRequired => '날짜를 선택해 주세요.';

  @override
  String get settings => '설정';

  @override
  String get language => '언어';

  @override
  String get languageSystem => '휴대폰 언어';

  @override
  String get privacyOptions => '광고 개인정보 옵션';

  @override
  String get factoryReset => '모든 데이터 초기화';

  @override
  String get factoryResetTitle => '모든 데이터 초기화';

  @override
  String get factoryResetMessage => '체중, 약, 카운터, 목록, 사진 데이터가 모두 삭제됩니다. 계속할까요?';

  @override
  String weekDay(int week, int day) {
    return '$week주 $day일';
  }

  @override
  String trimester(int n) {
    return '임신 $n기';
  }

  @override
  String get daysPassed => '지난 날';

  @override
  String get daysLeft => '남은 날';

  @override
  String get dueDate => '출산 예정일';

  @override
  String get babyToday => '오늘의 아기';

  @override
  String get motherToday => '오늘의 엄마';

  @override
  String dailyBabyTitle(int week) {
    return '우리 아기 · $week주';
  }

  @override
  String dailyMotherTitle(int week) {
    return '엄마 · $week주';
  }

  @override
  String get noInfoToday => '오늘의 정보가 없습니다.';

  @override
  String get ringBirth => '출산까지';

  @override
  String get ringTests => '검사';

  @override
  String get ringNeeds => '출산 준비물';

  @override
  String get ringBag => '출산 가방';

  @override
  String get weightChange => '체중 변화';

  @override
  String get tools => '도구';

  @override
  String get toolWeight => '체중 기록';

  @override
  String get toolMedicine => '약 관리';

  @override
  String get toolKick => '태동 카운터';

  @override
  String get toolContraction => '진통 타이머';

  @override
  String get toolNeeds => '아기 준비물';

  @override
  String get toolBag => '출산 가방';

  @override
  String get toolTests => '산전 검사';

  @override
  String get toolNames => '이름 찾기';

  @override
  String get toolAlbum => '사진 앨범';

  @override
  String get suggest => '의견 보내기';

  @override
  String get rate => '평가하기';

  @override
  String get emailError => '이메일 앱을 열 수 없습니다.';

  @override
  String get suggestSubject => '마이 베이비 앱 의견';

  @override
  String get suggestBody => '의견:';

  @override
  String get weightStart => '시작 체중';

  @override
  String get weightToday => '오늘 체중';

  @override
  String get weightHint => '예: 62.5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => '체중 추가';

  @override
  String get weightClearTitle => '체중 데이터';

  @override
  String get weightClearMessage => '모든 체중 기록이 삭제됩니다.';

  @override
  String get weightEmpty => '아직 기록이 없어요. 시작 체중을 입력해 기록을 시작하세요.';

  @override
  String totalChange(String value) {
    return '총 변화: $value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return '$week주 · $date';
  }

  @override
  String get medAdd => '약 추가';

  @override
  String get medEmpty => '약을 추가하면 매일 선택한 시간에 알려 드려요.';

  @override
  String get medNew => '새 약';

  @override
  String get medEdit => '약 편집';

  @override
  String get medName => '약 이름';

  @override
  String get medTime => '시간';

  @override
  String get medReminderOn => '알림 켜기';

  @override
  String medDaily(String time, String meal) {
    return '매일 $time · $meal';
  }

  @override
  String get mealEmpty => '공복';

  @override
  String get mealFull => '식후';

  @override
  String get mealAny => '상관없음';

  @override
  String notifTitle(String name) {
    return '약: $name';
  }

  @override
  String get notifEmpty => '공복에 복용하는 것을 잊지 마세요';

  @override
  String get notifFull => '식후에 복용하는 것을 잊지 마세요';

  @override
  String get notifAny => '약 먹을 시간이에요';

  @override
  String get notifChannel => '약 알림';

  @override
  String get notifChannelDesc => '복약 시간 알림';

  @override
  String get notifPermissionDenied => '알림 권한이 없어 알림이 울리지 않습니다.';

  @override
  String get kickIdle => '태동';

  @override
  String get kickTap => '콩!';

  @override
  String get stopAndSave => '종료 후 저장';

  @override
  String get kickHelp =>
      '아기가 움직일 때마다 원을 탭하세요. 일반적인 기준: 2시간 안에 10번. 걱정되면 의사와 상담하세요.';

  @override
  String get kickEmpty => '저장된 기록이 없습니다.';

  @override
  String kickRow(int count, String duration) {
    return '태동 $count회 · $duration';
  }

  @override
  String get contractionRunning => '진통 중';

  @override
  String get contractionIdle => '진통이 시작되면 탭하세요';

  @override
  String get contractionStartBtn => '시작';

  @override
  String get contractionStopBtn => '끝';

  @override
  String get contractionHelp => '진통이 규칙적이고 간격이 짧아지면(예: 5분마다 1분씩) 병원에 연락하세요.';

  @override
  String get contractionEmpty => '저장된 진통이 없습니다.';

  @override
  String contractionDuration(String duration) {
    return '지속 $duration';
  }

  @override
  String contractionGap(String duration) {
    return '이전과 간격 $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return '최근 1시간: 진통 $count회 · 평균 $length 지속, $minutes분마다';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total 완료';
  }

  @override
  String get addItem => '항목 추가';

  @override
  String get newItem => '새 항목';

  @override
  String get customGroup => '내가 추가한 항목';

  @override
  String get testsDisclaimer => '이 목록은 일반 정보입니다. 나에게 맞는 검사 일정은 의사에게 확인하세요.';

  @override
  String get namesTitle => '우리 아기 이름';

  @override
  String get spinning => '돌림판 도는 중…';

  @override
  String get namesHint => '돌림판을 탭하거나 휴대폰을 흔드세요';

  @override
  String get nameError => '이름을 가져오지 못했습니다.';

  @override
  String get shareAll => '모두 공유';

  @override
  String get ultrasoundPhoto => '초음파 사진';

  @override
  String get takePhoto => '사진 찍기';

  @override
  String get pickGallery => '갤러리에서 선택';

  @override
  String get share => '공유';

  @override
  String get remove => '제거';

  @override
  String get photoError => '사진을 가져오지 못했습니다. 권한을 확인하세요.';

  @override
  String get addPhotosFirst => '먼저 앨범에 사진을 추가하세요.';

  @override
  String photoN(int n) {
    return '사진 $n';
  }

  @override
  String get shareText => '우리 아기 초음파 사진';

  @override
  String get shareAllText => '우리 아기 초음파 앨범';

  @override
  String get chartBaby => '아기(추정)';

  @override
  String get chartMother => '엄마';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return '아기 추정 체중: $value';
  }

  @override
  String get babyWeightTooEarly => '아기 체중은 8주부터 표시됩니다.';

  @override
  String get babyWeightNote => '평균값이며 아기마다 다르게 자랍니다. 정확한 정보는 의사와 상담하세요.';

  @override
  String get babyBornQuestion => '아기가 태어났나요? 🎉';

  @override
  String get babyBornAction => '아기가 태어났어요';

  @override
  String get babyBornTitle => '환영해, 아가야!';

  @override
  String get birthDateLabel => '생년월일';

  @override
  String get birthWeight => '출생 체중 (kg)';

  @override
  String get birthLength => '출생 키 (cm)';

  @override
  String get optional => '선택';

  @override
  String get backToPregnancy => '임신 모드로 돌아가기';

  @override
  String get weeklyNotifSetting => '주간 알림';

  @override
  String get weeklyNotifChannel => '주간 소식';

  @override
  String weeklyNotifTitle(int week) {
    return '$week주차가 되었어요 💕';
  }

  @override
  String get weeklyNotifBody => '이번 주 정보가 준비됐어요.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name가 $month개월이 되었어요! 🎉';
  }

  @override
  String get monthlyNotifBody => '이번 달 발달을 확인해 보세요.';

  @override
  String babyAge(int months, int days) {
    return '$months개월 $days일';
  }

  @override
  String monthTitle(int month) {
    return '$month개월 발달';
  }

  @override
  String get newbornTitle => '신생아기';

  @override
  String get showMore => '더 보기';

  @override
  String get lastFeeding => '마지막 수유';

  @override
  String get diapersToday => '오늘 기저귀';

  @override
  String get sleepToday => '오늘 수면';

  @override
  String agoHM(int h, int m) {
    return '$h시간 $m분 전';
  }

  @override
  String agoM(int m) {
    return '$m분 전';
  }

  @override
  String durationHM(int h, int m) {
    return '$h시간 $m분';
  }

  @override
  String get toolFeeding => '수유';

  @override
  String get toolDiaper => '기저귀';

  @override
  String get toolSleep => '수면';

  @override
  String get toolGrowth => '성장';

  @override
  String get breastLeft => '왼쪽';

  @override
  String get breastRight => '오른쪽';

  @override
  String get bottle => '젖병';

  @override
  String get solid => '이유식';

  @override
  String get tapToStop => '끝내려면 같은 쪽을 다시 탭하세요';

  @override
  String get bottleAmount => '젖병 양';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => '오늘';

  @override
  String feedCount(int count) {
    return '수유 $count회';
  }

  @override
  String breastMinutes(int minutes) {
    return '모유 $minutes분';
  }

  @override
  String bottleTotal(int ml) {
    return '젖병 ${ml}ml';
  }

  @override
  String get diaperWet => '소변';

  @override
  String get diaperDirty => '대변';

  @override
  String get diaperBoth => '둘 다';

  @override
  String diaperCount(int count) {
    return '기저귀 $count개';
  }

  @override
  String get sleepStart => '잠듦';

  @override
  String get sleepStop => '깸';

  @override
  String get sleepRunning => '자는 중';

  @override
  String sleepTotal(String duration) {
    return '오늘 합계 $duration';
  }

  @override
  String get growthAdd => '측정 추가';

  @override
  String get growthWeight => '체중 (kg)';

  @override
  String get growthLength => '키 (cm)';

  @override
  String get growthHead => '머리둘레 (cm)';

  @override
  String get growthHeadShort => '머리';

  @override
  String get growthEmpty => '아직 측정 기록이 없어요. 검진 때 잰 값을 추가하세요.';

  @override
  String get whoMedian => 'WHO 평균';

  @override
  String get babyWeightLabel => '아기 체중';

  @override
  String monthAxis(int month) {
    return '$month개월';
  }

  @override
  String get otherTools => '기타 도구';

  @override
  String get noRecords => '아직 기록이 없어요.';

  @override
  String get dailyMsgSetting => '아침 인사 메시지';

  @override
  String get premiumTitle => '광고 제거';

  @override
  String get premiumDesc =>
      '한 번의 결제로 광고 없이 앱을 사용하세요. 같은 스토어 계정을 쓰는 다른 기기에서도 적용됩니다.';

  @override
  String premiumBuy(String price) {
    return '광고 없이 – $price';
  }

  @override
  String get premiumBuyNoPrice => '지금은 스토어를 사용할 수 없습니다';

  @override
  String get premiumRestore => '구매 복원';

  @override
  String get premiumActive => '광고 없는 버전이 활성화되었습니다. 응원해 주셔서 감사합니다 💕';

  @override
  String get premiumUnavailable => '구매를 완료하지 못했습니다. 나중에 다시 시도해 주세요.';

  @override
  String get premiumThanks => '감사합니다! 이제 광고가 표시되지 않습니다 💕';
}
