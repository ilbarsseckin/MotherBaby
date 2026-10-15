// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class LJa extends L {
  LJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'マイベビー';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get delete => '削除';

  @override
  String get add => '追加';

  @override
  String get deleteAll => 'すべて削除';

  @override
  String get saved => '保存しました';

  @override
  String get swipeToDelete => '左にスワイプして削除';

  @override
  String get history => '履歴';

  @override
  String get start => 'スタート';

  @override
  String weekAxis(int week) {
    return '$week週';
  }

  @override
  String get welcomeTitle => 'ようこそ';

  @override
  String get welcomeSubtitle => '妊娠の経過を週ごとにお届けするため、いくつか教えてください。';

  @override
  String get babyName => '赤ちゃんの名前';

  @override
  String get sexLabel => '性別';

  @override
  String get sexGirl => '女の子';

  @override
  String get sexBoy => '男の子';

  @override
  String get sexUnknown => 'まだわからない';

  @override
  String get kinLabel => '赤ちゃんとの関係';

  @override
  String get kinMother => '母';

  @override
  String get kinFather => '父';

  @override
  String get kinAuntMaternal => 'おば（母方）';

  @override
  String get kinAuntPaternal => 'おば（父方）';

  @override
  String get kinUncleMaternal => 'おじ（母方）';

  @override
  String get kinUnclePaternal => 'おじ（父方）';

  @override
  String get kinSibling => 'きょうだい';

  @override
  String get kinGrandmother => '祖母';

  @override
  String get kinGrandfather => '祖父';

  @override
  String get kinOther => '親族';

  @override
  String get whichDate => 'どちらの日付がわかりますか？';

  @override
  String get lastPeriod => '最終月経';

  @override
  String get dueDateShort => '出産予定日';

  @override
  String get lastPeriodLong => '最終月経の開始日';

  @override
  String get dueDateLong => '出産予定日';

  @override
  String get tapToSelect => 'タップして選択';

  @override
  String profilePreview(String date, int week, int day) {
    return '出産予定日：$date · $week週$day日';
  }

  @override
  String get begin => 'はじめる';

  @override
  String get nameRequired => '赤ちゃんの名前（またはニックネーム）を入力してください。';

  @override
  String get dateRequired => '日付を選択してください。';

  @override
  String get settings => '設定';

  @override
  String get language => '言語';

  @override
  String get languageSystem => '端末の言語';

  @override
  String get privacyOptions => '広告のプライバシー設定';

  @override
  String get factoryReset => 'すべてのデータを消去';

  @override
  String get factoryResetTitle => 'すべてのデータを消去';

  @override
  String get factoryResetMessage => '体重・お薬・カウンター・リスト・写真のデータがすべて削除されます。よろしいですか？';

  @override
  String weekDay(int week, int day) {
    return '$week週$day日';
  }

  @override
  String trimester(int n) {
    return '妊娠第$n期';
  }

  @override
  String get daysPassed => '経過日数';

  @override
  String get daysLeft => '残り日数';

  @override
  String get dueDate => '出産予定日';

  @override
  String get babyToday => '今日の赤ちゃん';

  @override
  String get motherToday => '今日のママ';

  @override
  String dailyBabyTitle(int week) {
    return '赤ちゃん · $week週';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'ママ · $week週';
  }

  @override
  String get noInfoToday => '今日の情報はありません。';

  @override
  String get ringBirth => '出産まで';

  @override
  String get ringTests => '検査';

  @override
  String get ringNeeds => 'ベビー用品';

  @override
  String get ringBag => '入院バッグ';

  @override
  String get weightChange => '体重の推移';

  @override
  String get tools => 'ツール';

  @override
  String get toolWeight => '体重記録';

  @override
  String get toolMedicine => 'お薬管理';

  @override
  String get toolKick => '胎動カウンター';

  @override
  String get toolContraction => '陣痛タイマー';

  @override
  String get toolNeeds => 'ベビー用品リスト';

  @override
  String get toolBag => '入院準備バッグ';

  @override
  String get toolTests => '妊婦健診';

  @override
  String get toolNames => '名前さがし';

  @override
  String get toolAlbum => 'フォトアルバム';

  @override
  String get suggest => 'ご意見を送る';

  @override
  String get rate => '評価する';

  @override
  String get emailError => 'メールアプリを開けませんでした。';

  @override
  String get suggestSubject => '「マイベビー」アプリへのご意見';

  @override
  String get suggestBody => 'ご意見：';

  @override
  String get weightStart => '妊娠前の体重';

  @override
  String get weightToday => '今日の体重';

  @override
  String get weightHint => '例：62.5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => '体重を記録';

  @override
  String get weightClearTitle => '体重データ';

  @override
  String get weightClearMessage => '体重の記録がすべて削除されます。';

  @override
  String get weightEmpty => 'まだ記録がありません。最初の体重を入力して始めましょう。';

  @override
  String totalChange(String value) {
    return '合計の変化：$value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return '$week週 · $date';
  }

  @override
  String get medAdd => 'お薬を追加';

  @override
  String get medEmpty => 'お薬を追加すると、毎日選んだ時間にお知らせします。';

  @override
  String get medNew => '新しいお薬';

  @override
  String get medEdit => 'お薬を編集';

  @override
  String get medName => 'お薬の名前';

  @override
  String get medTime => '時刻';

  @override
  String get medReminderOn => 'リマインダーをオン';

  @override
  String medDaily(String time, String meal) {
    return '毎日 $time · $meal';
  }

  @override
  String get mealEmpty => '空腹時';

  @override
  String get mealFull => '食後';

  @override
  String get mealAny => 'いつでも';

  @override
  String notifTitle(String name) {
    return 'お薬：$name';
  }

  @override
  String get notifEmpty => '空腹時に飲むのを忘れずに';

  @override
  String get notifFull => '食後に飲むのを忘れずに';

  @override
  String get notifAny => 'お薬の時間です';

  @override
  String get notifChannel => 'お薬リマインダー';

  @override
  String get notifChannelDesc => '服薬時間のお知らせ';

  @override
  String get notifPermissionDenied => '通知が許可されていないため、リマインダーは鳴りません。';

  @override
  String get kickIdle => '胎動';

  @override
  String get kickTap => 'ポコッ！';

  @override
  String get stopAndSave => '終了して保存';

  @override
  String get kickHelp =>
      '赤ちゃんが動くたびに円をタップしてください。目安は2時間以内に10回です。気になることがあれば医師に相談してください。';

  @override
  String get kickEmpty => '保存された記録はありません。';

  @override
  String kickRow(int count, String duration) {
    return '$count回 · $duration';
  }

  @override
  String get contractionRunning => '陣痛中';

  @override
  String get contractionIdle => '陣痛が始まったらタップ';

  @override
  String get contractionStartBtn => '始まった';

  @override
  String get contractionStopBtn => '終わった';

  @override
  String get contractionHelp => '陣痛が規則的で間隔が短くなってきたら（例：5分おきに1分間）、病院に連絡してください。';

  @override
  String get contractionEmpty => '保存された陣痛はありません。';

  @override
  String contractionDuration(String duration) {
    return '持続 $duration';
  }

  @override
  String contractionGap(String duration) {
    return '前回から $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return '直近1時間：$count回 · 平均$length、$minutes分おき';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total 完了';
  }

  @override
  String get addItem => '項目を追加';

  @override
  String get newItem => '新しい項目';

  @override
  String get customGroup => '追加した項目';

  @override
  String get testsDisclaimer => 'このリストは一般的な情報です。あなたに合った健診スケジュールは医師に確認してください。';

  @override
  String get namesTitle => '赤ちゃんの名前';

  @override
  String get spinning => 'ルーレット回転中…';

  @override
  String get namesHint => 'ルーレットをタップするか、スマホを振ってください';

  @override
  String get nameError => '名前を取得できませんでした。';

  @override
  String get shareAll => 'すべて共有';

  @override
  String get ultrasoundPhoto => 'エコー写真';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get pickGallery => 'ギャラリーから選ぶ';

  @override
  String get share => '共有';

  @override
  String get remove => '削除';

  @override
  String get photoError => '写真を取得できませんでした。権限を確認してください。';

  @override
  String get addPhotosFirst => '先にアルバムに写真を追加してください。';

  @override
  String photoN(int n) {
    return '写真$n';
  }

  @override
  String get shareText => '赤ちゃんのエコー写真';

  @override
  String get shareAllText => '赤ちゃんのエコーアルバム';

  @override
  String get chartBaby => '赤ちゃん（推定）';

  @override
  String get chartMother => 'ママ';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return '赤ちゃんの推定体重：$value';
  }

  @override
  String get babyWeightTooEarly => '赤ちゃんの体重は8週目から表示されます。';

  @override
  String get babyWeightNote => '平均値です。成長には個人差があります。詳しくは医師にご相談ください。';

  @override
  String get babyBornQuestion => '赤ちゃんは生まれましたか？🎉';

  @override
  String get babyBornAction => '赤ちゃんが生まれた';

  @override
  String get babyBornTitle => 'ようこそ、赤ちゃん！';

  @override
  String get birthDateLabel => '誕生日';

  @override
  String get birthWeight => '出生体重（kg）';

  @override
  String get birthLength => '出生身長（cm）';

  @override
  String get optional => '任意';

  @override
  String get backToPregnancy => '妊娠モードに戻る';

  @override
  String get weeklyNotifSetting => '毎週のお知らせ';

  @override
  String get weeklyNotifChannel => '週ごとの情報';

  @override
  String weeklyNotifTitle(int week) {
    return '$week週目に入りました 💕';
  }

  @override
  String get weeklyNotifBody => '今週の情報が届きました。';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$nameが$monthか月になりました！🎉';
  }

  @override
  String get monthlyNotifBody => '今月の成長をチェックしましょう。';

  @override
  String babyAge(int months, int days) {
    return '$monthsか月$days日';
  }

  @override
  String monthTitle(int month) {
    return '$monthか月の成長';
  }

  @override
  String get newbornTitle => '新生児期';

  @override
  String get showMore => '続きを読む';

  @override
  String get lastFeeding => '最後の授乳';

  @override
  String get diapersToday => '今日のおむつ';

  @override
  String get sleepToday => '今日の睡眠';

  @override
  String agoHM(int h, int m) {
    return '$h時間$m分前';
  }

  @override
  String agoM(int m) {
    return '$m分前';
  }

  @override
  String durationHM(int h, int m) {
    return '$h時間$m分';
  }

  @override
  String get toolFeeding => '授乳';

  @override
  String get toolDiaper => 'おむつ';

  @override
  String get toolSleep => '睡眠';

  @override
  String get toolGrowth => '成長';

  @override
  String get breastLeft => '左';

  @override
  String get breastRight => '右';

  @override
  String get bottle => 'ミルク';

  @override
  String get solid => '離乳食';

  @override
  String get tapToStop => '終わるときは同じ側をもう一度タップ';

  @override
  String get bottleAmount => 'ミルクの量';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => '今日';

  @override
  String feedCount(int count) {
    return '$count回';
  }

  @override
  String breastMinutes(int minutes) {
    return '授乳$minutes分';
  }

  @override
  String bottleTotal(int ml) {
    return 'ミルク${ml}ml';
  }

  @override
  String get diaperWet => 'おしっこ';

  @override
  String get diaperDirty => 'うんち';

  @override
  String get diaperBoth => '両方';

  @override
  String diaperCount(int count) {
    return '$count枚';
  }

  @override
  String get sleepStart => '寝た';

  @override
  String get sleepStop => '起きた';

  @override
  String get sleepRunning => '睡眠中';

  @override
  String sleepTotal(String duration) {
    return '今日の合計 $duration';
  }

  @override
  String get growthAdd => '記録を追加';

  @override
  String get growthWeight => '体重（kg）';

  @override
  String get growthLength => '身長（cm）';

  @override
  String get growthHead => '頭囲（cm）';

  @override
  String get growthHeadShort => '頭囲';

  @override
  String get growthEmpty => 'まだ記録がありません。健診で測った値を追加しましょう。';

  @override
  String get whoMedian => 'WHO平均';

  @override
  String get babyWeightLabel => '赤ちゃんの体重';

  @override
  String monthAxis(int month) {
    return '$monthか月';
  }

  @override
  String get otherTools => 'その他のツール';

  @override
  String get noRecords => 'まだ記録がありません。';

  @override
  String get dailyMsgSetting => 'おはようメッセージ';
}
