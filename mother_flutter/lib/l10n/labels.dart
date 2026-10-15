import 'app_localizations.dart';

/// Veritabanında/ayarlarda tutulan kodların seçili dildeki karşılıkları.
extension CodeLabels on L {
  String sex(String code) => switch (code) {
        'girl' => sexGirl,
        'boy' => sexBoy,
        _ => sexUnknown,
      };

  String kin(String code) => switch (code) {
        'mother' => kinMother,
        'father' => kinFather,
        'auntMaternal' => kinAuntMaternal,
        'auntPaternal' => kinAuntPaternal,
        'uncleMaternal' => kinUncleMaternal,
        'unclePaternal' => kinUnclePaternal,
        'sibling' => kinSibling,
        'grandmother' => kinGrandmother,
        'grandfather' => kinGrandfather,
        _ => kinOther,
      };

  String meal(String code) => switch (code) {
        'empty' => mealEmpty,
        'full' => mealFull,
        _ => mealAny,
      };

  String mealReminder(String code) => switch (code) {
        'empty' => notifEmpty,
        'full' => notifFull,
        _ => notifAny,
      };
}
