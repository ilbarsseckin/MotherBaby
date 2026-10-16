// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class LFr extends L {
  LFr([String locale = 'fr']) : super(locale);

  @override
  String weekN(int week) {
    return 'Semaine $week';
  }

  @override
  String get appTitle => 'Mon Bébé';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get delete => 'Supprimer';

  @override
  String get add => 'Ajouter';

  @override
  String get deleteAll => 'Tout supprimer';

  @override
  String get saved => 'Enregistré';

  @override
  String get swipeToDelete => 'Balayez vers la gauche pour supprimer.';

  @override
  String get history => 'Historique';

  @override
  String get start => 'Démarrer';

  @override
  String weekAxis(int week) {
    return 'S$week';
  }

  @override
  String get welcomeTitle => 'Bienvenue';

  @override
  String get welcomeSubtitle =>
      'Nous avons besoin de quelques informations pour suivre votre grossesse semaine après semaine.';

  @override
  String get babyName => 'Prénom du bébé';

  @override
  String get sexLabel => 'Sexe';

  @override
  String get sexGirl => 'Fille';

  @override
  String get sexBoy => 'Garçon';

  @override
  String get sexUnknown => 'Pas encore connu';

  @override
  String get kinLabel => 'Pour le bébé, vous êtes...';

  @override
  String get kinMother => 'La mère';

  @override
  String get kinFather => 'Le père';

  @override
  String get kinAuntMaternal => 'La tante (côté maternel)';

  @override
  String get kinAuntPaternal => 'La tante (côté paternel)';

  @override
  String get kinUncleMaternal => 'L\'oncle (côté maternel)';

  @override
  String get kinUnclePaternal => 'L\'oncle (côté paternel)';

  @override
  String get kinSibling => 'Frère ou sœur';

  @override
  String get kinGrandmother => 'La grand-mère';

  @override
  String get kinGrandfather => 'Le grand-père';

  @override
  String get kinOther => 'Un proche';

  @override
  String get whichDate => 'Quelle date connaissez-vous ?';

  @override
  String get lastPeriod => 'Dernières règles';

  @override
  String get dueDateShort => 'Terme prévu';

  @override
  String get lastPeriodLong => 'Premier jour des dernières règles';

  @override
  String get dueDateLong => 'Date prévue d\'accouchement';

  @override
  String get tapToSelect => 'Appuyez pour choisir';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Terme prévu : $date · semaine $week, jour $day';
  }

  @override
  String get begin => 'Commencer';

  @override
  String get nameRequired =>
      'Veuillez saisir un prénom (ou un surnom) pour votre bébé.';

  @override
  String get dateRequired => 'Veuillez choisir la date.';

  @override
  String get settings => 'Réglages';

  @override
  String get language => 'Langue';

  @override
  String get languageSystem => 'Langue du téléphone';

  @override
  String get privacyOptions => 'Options de confidentialité des annonces';

  @override
  String get factoryReset => 'Réinitialiser toutes les données';

  @override
  String get factoryResetTitle => 'Réinitialiser toutes les données';

  @override
  String get factoryResetMessage =>
      'Toutes vos données de poids, médicaments, compteurs, listes et photos seront supprimées. Êtes-vous sûre ?';

  @override
  String weekDay(int week, int day) {
    return 'Semaine $week, jour $day';
  }

  @override
  String trimester(int n) {
    return '${n}e trimestre';
  }

  @override
  String get daysPassed => 'jours passés';

  @override
  String get daysLeft => 'jours restants';

  @override
  String get dueDate => 'terme prévu';

  @override
  String get babyToday => 'Mon bébé aujourd\'hui';

  @override
  String get motherToday => 'Maman aujourd\'hui';

  @override
  String dailyBabyTitle(int week) {
    return 'Mon bébé · semaine $week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Maman · semaine $week';
  }

  @override
  String get noInfoToday => 'Aucune information pour aujourd\'hui.';

  @override
  String get ringBirth => 'Avant la naissance';

  @override
  String get ringTests => 'Examens';

  @override
  String get ringNeeds => 'Achats';

  @override
  String get ringBag => 'Valise';

  @override
  String get weightChange => 'Évolution du poids';

  @override
  String get tools => 'Outils';

  @override
  String get toolWeight => 'Suivi du poids';

  @override
  String get toolMedicine => 'Médicaments';

  @override
  String get toolKick => 'Compteur de coups';

  @override
  String get toolContraction => 'Contractions';

  @override
  String get toolNeeds => 'Liste de naissance';

  @override
  String get toolBag => 'Valise maternité';

  @override
  String get toolTests => 'Examens médicaux';

  @override
  String get toolNames => 'Idées de prénoms';

  @override
  String get toolAlbum => 'Album photo';

  @override
  String get suggest => 'Envoyer un avis';

  @override
  String get rate => 'Noter l\'appli';

  @override
  String get emailError =>
      'Impossible d\'ouvrir une application de messagerie.';

  @override
  String get suggestSubject => 'Suggestion pour l\'appli Mon Bébé';

  @override
  String get suggestBody => 'Votre suggestion :';

  @override
  String get weightStart => 'Votre poids de départ';

  @override
  String get weightToday => 'Votre poids aujourd\'hui';

  @override
  String get weightHint => 'ex. 62,5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => 'Ajouter un poids';

  @override
  String get weightClearTitle => 'Données de poids';

  @override
  String get weightClearMessage =>
      'Tous vos relevés de poids seront supprimés.';

  @override
  String get weightEmpty =>
      'Aucun relevé pour l\'instant. Saisissez votre poids de départ pour commencer.';

  @override
  String totalChange(String value) {
    return 'Variation totale : $value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'Semaine $week · $date';
  }

  @override
  String get medAdd => 'Ajouter un médicament';

  @override
  String get medEmpty =>
      'Ajoutez vos médicaments : nous vous le rappellerons chaque jour à l\'heure choisie.';

  @override
  String get medNew => 'Nouveau médicament';

  @override
  String get medEdit => 'Modifier le médicament';

  @override
  String get medName => 'Nom du médicament';

  @override
  String get medTime => 'Heure';

  @override
  String get medReminderOn => 'Rappel activé';

  @override
  String medDaily(String time, String meal) {
    return 'Tous les jours $time · $meal';
  }

  @override
  String get mealEmpty => 'À jeun';

  @override
  String get mealFull => 'Après le repas';

  @override
  String get mealAny => 'Peu importe';

  @override
  String notifTitle(String name) {
    return 'Médicament : $name';
  }

  @override
  String get notifEmpty => 'Pensez à le prendre à jeun';

  @override
  String get notifFull => 'Pensez à le prendre après le repas';

  @override
  String get notifAny => 'C\'est l\'heure de votre médicament';

  @override
  String get notifChannel => 'Rappel de médicament';

  @override
  String get notifChannelDesc => 'Rappels aux heures de prise';

  @override
  String get notifPermissionDenied =>
      'Notifications refusées : le rappel ne sonnera pas.';

  @override
  String get kickIdle => 'coups';

  @override
  String get kickTap => 'COUP !';

  @override
  String get stopAndSave => 'Terminer et enregistrer';

  @override
  String get kickHelp =>
      'Appuyez sur le cercle à chaque mouvement de votre bébé. Repère général : 10 mouvements en 2 heures. En cas d\'inquiétude, consultez votre médecin ou votre sage-femme.';

  @override
  String get kickEmpty => 'Aucune séance enregistrée.';

  @override
  String kickRow(int count, String duration) {
    return '$count coups · $duration';
  }

  @override
  String get contractionRunning => 'Contraction en cours';

  @override
  String get contractionIdle => 'Appuyez au début d\'une contraction';

  @override
  String get contractionStartBtn => 'DÉBUT';

  @override
  String get contractionStopBtn => 'FIN';

  @override
  String get contractionHelp =>
      'Si les contractions sont régulières et se rapprochent (par ex. toutes les 5 minutes, durant 1 minute), contactez la maternité ou votre médecin.';

  @override
  String get contractionEmpty => 'Aucune contraction enregistrée.';

  @override
  String contractionDuration(String duration) {
    return 'Durée $duration';
  }

  @override
  String contractionGap(String duration) {
    return '$duration depuis la précédente';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'Dernière heure : $count contractions · durée moyenne $length, toutes les $minutes minutes';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total terminés';
  }

  @override
  String get addItem => 'Ajouter un élément';

  @override
  String get newItem => 'Nouvel élément';

  @override
  String get customGroup => 'Mes ajouts';

  @override
  String get testsDisclaimer =>
      'Cette liste est donnée à titre informatif ; demandez à votre médecin votre calendrier d\'examens personnalisé.';

  @override
  String get namesTitle => 'Le prénom de mon bébé';

  @override
  String get spinning => 'La roue tourne…';

  @override
  String get namesHint => 'Touchez la roue ou secouez votre téléphone';

  @override
  String get nameError => 'Impossible d\'obtenir un prénom.';

  @override
  String get shareAll => 'Tout partager';

  @override
  String get ultrasoundPhoto => 'Photo d\'échographie';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get pickGallery => 'Choisir dans la galerie';

  @override
  String get share => 'Partager';

  @override
  String get remove => 'Retirer';

  @override
  String get photoError =>
      'Impossible de récupérer la photo. Vérifiez les autorisations.';

  @override
  String get addPhotosFirst => 'Ajoutez d\'abord des photos à l\'album.';

  @override
  String photoN(int n) {
    return 'Photo $n';
  }

  @override
  String get shareText => 'L\'échographie de mon bébé';

  @override
  String get shareAllText => 'L\'album d\'échographies de mon bébé';

  @override
  String get chartBaby => 'Bébé (estimé)';

  @override
  String get chartMother => 'Maman';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return 'Poids estimé du bébé : $value';
  }

  @override
  String get babyWeightTooEarly =>
      'Le poids du bébé s\'affiche à partir de la 8e semaine.';

  @override
  String get babyWeightNote =>
      'Ce sont des moyennes ; chaque bébé grandit différemment. Demandez à votre médecin.';

  @override
  String get babyBornQuestion => 'Votre bébé est-il né ? 🎉';

  @override
  String get babyBornAction => 'Mon bébé est né';

  @override
  String get babyBornTitle => 'Bienvenue, petit bout !';

  @override
  String get birthDateLabel => 'Date de naissance';

  @override
  String get birthWeight => 'Poids de naissance (kg)';

  @override
  String get birthLength => 'Taille de naissance (cm)';

  @override
  String get optional => 'facultatif';

  @override
  String get backToPregnancy => 'Revenir au mode grossesse';

  @override
  String get weeklyNotifSetting => 'Notifications hebdomadaires';

  @override
  String get weeklyNotifChannel => 'Infos de la semaine';

  @override
  String weeklyNotifTitle(int week) {
    return 'Bienvenue en semaine $week 💕';
  }

  @override
  String get weeklyNotifBody => 'Les infos de cette semaine sont prêtes.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name a $month mois ! 🎉';
  }

  @override
  String get monthlyNotifBody => 'Découvrez le développement de ce mois.';

  @override
  String babyAge(int months, int days) {
    return '$months mois $days j';
  }

  @override
  String monthTitle(int month) {
    return 'Développement du ${month}e mois';
  }

  @override
  String get newbornTitle => 'Période néonatale';

  @override
  String get showMore => 'Lire la suite';

  @override
  String get lastFeeding => 'dernier repas';

  @override
  String get diapersToday => 'couches aujourd\'hui';

  @override
  String get sleepToday => 'sommeil aujourd\'hui';

  @override
  String agoHM(int h, int m) {
    return 'il y a $h h $m min';
  }

  @override
  String agoM(int m) {
    return 'il y a $m min';
  }

  @override
  String durationHM(int h, int m) {
    return '$h h $m min';
  }

  @override
  String get toolFeeding => 'Repas';

  @override
  String get toolDiaper => 'Couches';

  @override
  String get toolSleep => 'Sommeil';

  @override
  String get toolGrowth => 'Croissance';

  @override
  String get breastLeft => 'Gauche';

  @override
  String get breastRight => 'Droit';

  @override
  String get bottle => 'Biberon';

  @override
  String get solid => 'Diversification';

  @override
  String get tapToStop => 'Touchez le même côté pour terminer';

  @override
  String get bottleAmount => 'Quantité au biberon';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => 'Aujourd\'hui';

  @override
  String feedCount(int count) {
    return '$count repas';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Allaitement $minutes min';
  }

  @override
  String bottleTotal(int ml) {
    return 'Biberon $ml ml';
  }

  @override
  String get diaperWet => 'Mouillée';

  @override
  String get diaperDirty => 'Selles';

  @override
  String get diaperBoth => 'Les deux';

  @override
  String diaperCount(int count) {
    return '$count couches';
  }

  @override
  String get sleepStart => 'Endormi';

  @override
  String get sleepStop => 'Réveillé';

  @override
  String get sleepRunning => 'Dort';

  @override
  String sleepTotal(String duration) {
    return 'Total aujourd\'hui $duration';
  }

  @override
  String get growthAdd => 'Ajouter une mesure';

  @override
  String get growthWeight => 'Poids (kg)';

  @override
  String get growthLength => 'Taille (cm)';

  @override
  String get growthHead => 'Périmètre crânien (cm)';

  @override
  String get growthHeadShort => 'Tête';

  @override
  String get growthEmpty =>
      'Aucune mesure. Ajoutez les valeurs mesurées lors des visites.';

  @override
  String get whoMedian => 'Moyenne OMS';

  @override
  String get babyWeightLabel => 'Poids du bébé';

  @override
  String monthAxis(int month) {
    return '$month mois';
  }

  @override
  String get otherTools => 'Autres outils';

  @override
  String get noRecords => 'Aucun enregistrement.';

  @override
  String get dailyMsgSetting => 'Messages du matin';

  @override
  String get premiumTitle => 'Supprimer les pubs';

  @override
  String get premiumDesc =>
      'Utilisez l\'application sans publicité grâce à un paiement unique. L\'achat est aussi valable sur vos autres appareils avec le même compte.';

  @override
  String premiumBuy(String price) {
    return 'Sans pub – $price';
  }

  @override
  String get premiumBuyNoPrice =>
      'La boutique n\'est pas disponible pour le moment';

  @override
  String get premiumRestore => 'Restaurer l\'achat';

  @override
  String get premiumActive =>
      'La version sans publicité est active. Merci pour votre soutien 💕';

  @override
  String get premiumUnavailable =>
      'L\'achat n\'a pas pu aboutir. Réessayez plus tard.';

  @override
  String get premiumThanks => 'Merci ! Vous ne verrez plus de publicités 💕';
}
