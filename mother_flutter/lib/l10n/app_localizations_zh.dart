// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class LZh extends L {
  LZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '我的宝宝';

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get delete => '删除';

  @override
  String get add => '添加';

  @override
  String get deleteAll => '全部删除';

  @override
  String get saved => '已保存';

  @override
  String get swipeToDelete => '向左滑动即可删除。';

  @override
  String get history => '记录';

  @override
  String get start => '开始';

  @override
  String weekAxis(int week) {
    return '$week周';
  }

  @override
  String get welcomeTitle => '欢迎';

  @override
  String get welcomeSubtitle => '我们需要一些信息，以便每周陪你了解孕期变化。';

  @override
  String get babyName => '宝宝的名字';

  @override
  String get sexLabel => '性别';

  @override
  String get sexGirl => '女孩';

  @override
  String get sexBoy => '男孩';

  @override
  String get sexUnknown => '暂不知道';

  @override
  String get kinLabel => '你是宝宝的…';

  @override
  String get kinMother => '妈妈';

  @override
  String get kinFather => '爸爸';

  @override
  String get kinAuntMaternal => '姨妈';

  @override
  String get kinAuntPaternal => '姑姑';

  @override
  String get kinUncleMaternal => '舅舅';

  @override
  String get kinUnclePaternal => '叔叔/伯伯';

  @override
  String get kinSibling => '哥哥姐姐';

  @override
  String get kinGrandmother => '奶奶/外婆';

  @override
  String get kinGrandfather => '爷爷/外公';

  @override
  String get kinOther => '亲人';

  @override
  String get whichDate => '你知道哪个日期？';

  @override
  String get lastPeriod => '末次月经';

  @override
  String get dueDateShort => '预产期';

  @override
  String get lastPeriodLong => '末次月经第一天';

  @override
  String get dueDateLong => '预产期';

  @override
  String get tapToSelect => '点击选择';

  @override
  String profilePreview(String date, int week, int day) {
    return '预产期：$date · 第$week周第$day天';
  }

  @override
  String get begin => '开始';

  @override
  String get nameRequired => '请给宝宝填写一个名字（或小名）。';

  @override
  String get dateRequired => '请选择日期。';

  @override
  String get settings => '设置';

  @override
  String get language => '语言';

  @override
  String get languageSystem => '手机语言';

  @override
  String get privacyOptions => '广告隐私选项';

  @override
  String get factoryReset => '清除所有数据';

  @override
  String get factoryResetTitle => '清除所有数据';

  @override
  String get factoryResetMessage => '体重、用药、计数器、清单和照片数据将全部删除。确定吗？';

  @override
  String weekDay(int week, int day) {
    return '第$week周第$day天';
  }

  @override
  String trimester(int n) {
    return '孕$n期';
  }

  @override
  String get daysPassed => '已过天数';

  @override
  String get daysLeft => '剩余天数';

  @override
  String get dueDate => '预产期';

  @override
  String get babyToday => '宝宝今天';

  @override
  String get motherToday => '妈妈今天';

  @override
  String dailyBabyTitle(int week) {
    return '我的宝宝 · 第$week周';
  }

  @override
  String dailyMotherTitle(int week) {
    return '妈妈 · 第$week周';
  }

  @override
  String get noInfoToday => '今天暂无信息。';

  @override
  String get ringBirth => '距分娩';

  @override
  String get ringTests => '检查';

  @override
  String get ringNeeds => '待产品';

  @override
  String get ringBag => '待产包';

  @override
  String get weightChange => '体重变化';

  @override
  String get tools => '工具';

  @override
  String get toolWeight => '体重记录';

  @override
  String get toolMedicine => '用药提醒';

  @override
  String get toolKick => '数胎动';

  @override
  String get toolContraction => '宫缩计时';

  @override
  String get toolNeeds => '宝宝用品清单';

  @override
  String get toolBag => '待产包';

  @override
  String get toolTests => '产检项目';

  @override
  String get toolNames => '起名';

  @override
  String get toolAlbum => '相册';

  @override
  String get suggest => '发送建议';

  @override
  String get rate => '评分';

  @override
  String get emailError => '无法打开邮件应用。';

  @override
  String get suggestSubject => '关于“我的宝宝”应用的建议';

  @override
  String get suggestBody => '你的建议：';

  @override
  String get weightStart => '初始体重';

  @override
  String get weightToday => '今天的体重';

  @override
  String get weightHint => '例如 62.5';

  @override
  String get kg => '公斤';

  @override
  String get weightAdd => '记录体重';

  @override
  String get weightClearTitle => '体重数据';

  @override
  String get weightClearMessage => '所有体重记录将被删除。';

  @override
  String get weightEmpty => '暂无记录。输入初始体重开始记录吧。';

  @override
  String totalChange(String value) {
    return '总变化：$value 公斤';
  }

  @override
  String weekAndDate(int week, String date) {
    return '第$week周 · $date';
  }

  @override
  String get medAdd => '添加药物';

  @override
  String get medEmpty => '添加你的药物，我们会每天在你选择的时间提醒你。';

  @override
  String get medNew => '新药物';

  @override
  String get medEdit => '编辑药物';

  @override
  String get medName => '药物名称';

  @override
  String get medTime => '时间';

  @override
  String get medReminderOn => '开启提醒';

  @override
  String medDaily(String time, String meal) {
    return '每天 $time · $meal';
  }

  @override
  String get mealEmpty => '空腹';

  @override
  String get mealFull => '饭后';

  @override
  String get mealAny => '不限';

  @override
  String notifTitle(String name) {
    return '用药：$name';
  }

  @override
  String get notifEmpty => '记得空腹服用';

  @override
  String get notifFull => '记得饭后服用';

  @override
  String get notifAny => '该吃药了';

  @override
  String get notifChannel => '用药提醒';

  @override
  String get notifChannelDesc => '在服药时间提醒';

  @override
  String get notifPermissionDenied => '未获得通知权限，提醒将不会响起。';

  @override
  String get kickIdle => '胎动';

  @override
  String get kickTap => '动了！';

  @override
  String get stopAndSave => '结束并保存';

  @override
  String get kickHelp => '宝宝每动一次就点一下圆圈。一般参考：2小时内10次胎动。如有担心，请咨询医生。';

  @override
  String get kickEmpty => '暂无记录。';

  @override
  String kickRow(int count, String duration) {
    return '$count次胎动 · $duration';
  }

  @override
  String get contractionRunning => '宫缩进行中';

  @override
  String get contractionIdle => '宫缩开始时点击';

  @override
  String get contractionStartBtn => '开始';

  @override
  String get contractionStopBtn => '结束';

  @override
  String get contractionHelp => '如果宫缩规律且越来越频繁（例如每5分钟一次，每次持续1分钟），请联系医生。';

  @override
  String get contractionEmpty => '暂无宫缩记录。';

  @override
  String contractionDuration(String duration) {
    return '持续 $duration';
  }

  @override
  String contractionGap(String duration) {
    return '距上次 $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return '最近1小时：$count次宫缩 · 平均持续$length，每$minutes分钟一次';
  }

  @override
  String progressLabel(int done, int total) {
    return '已完成 $done / $total';
  }

  @override
  String get addItem => '添加项目';

  @override
  String get newItem => '新项目';

  @override
  String get customGroup => '我添加的';

  @override
  String get testsDisclaimer => '此清单仅供一般参考，具体产检安排请咨询医生。';

  @override
  String get namesTitle => '宝宝的名字';

  @override
  String get spinning => '转盘转动中…';

  @override
  String get namesHint => '点击转盘或摇一摇手机';

  @override
  String get nameError => '未能获取名字。';

  @override
  String get shareAll => '全部分享';

  @override
  String get ultrasoundPhoto => 'B超照片';

  @override
  String get takePhoto => '拍照';

  @override
  String get pickGallery => '从相册选择';

  @override
  String get share => '分享';

  @override
  String get remove => '移除';

  @override
  String get photoError => '无法获取照片，请检查权限。';

  @override
  String get addPhotosFirst => '请先向相册添加照片。';

  @override
  String photoN(int n) {
    return '照片$n';
  }

  @override
  String get shareText => '我宝宝的B超照片';

  @override
  String get shareAllText => '我宝宝的B超相册';

  @override
  String get chartBaby => '宝宝（估算）';

  @override
  String get chartMother => '妈妈';

  @override
  String get gram => '克';

  @override
  String babyWeightNow(String value) {
    return '宝宝估算体重：$value';
  }

  @override
  String get babyWeightTooEarly => '宝宝体重从第8周开始显示。';

  @override
  String get babyWeightNote => '以上为平均值，每个宝宝发育不同，具体请咨询医生。';

  @override
  String get babyBornQuestion => '宝宝出生了吗？🎉';

  @override
  String get babyBornAction => '宝宝出生了';

  @override
  String get babyBornTitle => '欢迎你，小宝贝！';

  @override
  String get birthDateLabel => '出生日期';

  @override
  String get birthWeight => '出生体重（公斤）';

  @override
  String get birthLength => '出生身长（厘米）';

  @override
  String get optional => '选填';

  @override
  String get backToPregnancy => '返回孕期模式';

  @override
  String get weeklyNotifSetting => '每周提醒';

  @override
  String get weeklyNotifChannel => '每周资讯';

  @override
  String weeklyNotifTitle(int week) {
    return '欢迎来到第$week周 💕';
  }

  @override
  String get weeklyNotifBody => '本周资讯已准备好。';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name$month个月啦！🎉';
  }

  @override
  String get monthlyNotifBody => '看看本月的发育情况。';

  @override
  String babyAge(int months, int days) {
    return '$months个月$days天';
  }

  @override
  String monthTitle(int month) {
    return '第$month个月发育';
  }

  @override
  String get newbornTitle => '新生儿期';

  @override
  String get showMore => '阅读更多';

  @override
  String get lastFeeding => '上次喂养';

  @override
  String get diapersToday => '今日尿布';

  @override
  String get sleepToday => '今日睡眠';

  @override
  String agoHM(int h, int m) {
    return '$h小时$m分钟前';
  }

  @override
  String agoM(int m) {
    return '$m分钟前';
  }

  @override
  String durationHM(int h, int m) {
    return '$h小时$m分钟';
  }

  @override
  String get toolFeeding => '喂养';

  @override
  String get toolDiaper => '尿布';

  @override
  String get toolSleep => '睡眠';

  @override
  String get toolGrowth => '生长';

  @override
  String get breastLeft => '左侧';

  @override
  String get breastRight => '右侧';

  @override
  String get bottle => '奶瓶';

  @override
  String get solid => '辅食';

  @override
  String get tapToStop => '再次点击同一侧结束';

  @override
  String get bottleAmount => '奶量';

  @override
  String get ml => '毫升';

  @override
  String get todaySummary => '今天';

  @override
  String feedCount(int count) {
    return '$count次喂养';
  }

  @override
  String breastMinutes(int minutes) {
    return '亲喂$minutes分钟';
  }

  @override
  String bottleTotal(int ml) {
    return '奶瓶$ml毫升';
  }

  @override
  String get diaperWet => '湿';

  @override
  String get diaperDirty => '便便';

  @override
  String get diaperBoth => '都有';

  @override
  String diaperCount(int count) {
    return '$count片尿布';
  }

  @override
  String get sleepStart => '睡着了';

  @override
  String get sleepStop => '醒了';

  @override
  String get sleepRunning => '睡眠中';

  @override
  String sleepTotal(String duration) {
    return '今日共$duration';
  }

  @override
  String get growthAdd => '添加测量';

  @override
  String get growthWeight => '体重（公斤）';

  @override
  String get growthLength => '身长（厘米）';

  @override
  String get growthHead => '头围（厘米）';

  @override
  String get growthHeadShort => '头围';

  @override
  String get growthEmpty => '暂无测量。请添加体检时测得的数值。';

  @override
  String get whoMedian => '世卫组织平均值';

  @override
  String get babyWeightLabel => '宝宝体重';

  @override
  String monthAxis(int month) {
    return '$month月';
  }

  @override
  String get otherTools => '其他工具';

  @override
  String get noRecords => '暂无记录。';

  @override
  String get dailyMsgSetting => '早安消息';
}
