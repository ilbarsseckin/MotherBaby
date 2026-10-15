// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class LIt extends L {
  LIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Il Mio Bebè';

  @override
  String get cancel => 'Annulla';

  @override
  String get save => 'Salva';

  @override
  String get delete => 'Elimina';

  @override
  String get add => 'Aggiungi';

  @override
  String get deleteAll => 'Elimina tutto';

  @override
  String get saved => 'Salvato';

  @override
  String get swipeToDelete => 'Scorri verso sinistra per eliminare.';

  @override
  String get history => 'Cronologia';

  @override
  String get start => 'Avvia';

  @override
  String weekAxis(int week) {
    return 'sett. $week';
  }

  @override
  String get welcomeTitle => 'Benvenuta';

  @override
  String get welcomeSubtitle =>
      'Ci servono alcune informazioni per seguire la tua gravidanza settimana dopo settimana.';

  @override
  String get babyName => 'Nome del bebè';

  @override
  String get sexLabel => 'Sesso';

  @override
  String get sexGirl => 'Femmina';

  @override
  String get sexBoy => 'Maschio';

  @override
  String get sexUnknown => 'Non ancora noto';

  @override
  String get kinLabel => 'Per il bebè sei...';

  @override
  String get kinMother => 'La mamma';

  @override
  String get kinFather => 'Il papà';

  @override
  String get kinAuntMaternal => 'La zia (lato materno)';

  @override
  String get kinAuntPaternal => 'La zia (lato paterno)';

  @override
  String get kinUncleMaternal => 'Lo zio (lato materno)';

  @override
  String get kinUnclePaternal => 'Lo zio (lato paterno)';

  @override
  String get kinSibling => 'Fratello o sorella';

  @override
  String get kinGrandmother => 'La nonna';

  @override
  String get kinGrandfather => 'Il nonno';

  @override
  String get kinOther => 'Un parente';

  @override
  String get whichDate => 'Quale data conosci?';

  @override
  String get lastPeriod => 'Ultime mestruazioni';

  @override
  String get dueDateShort => 'Data presunta';

  @override
  String get lastPeriodLong => 'Primo giorno dell\'ultima mestruazione';

  @override
  String get dueDateLong => 'Data presunta del parto';

  @override
  String get tapToSelect => 'Tocca per scegliere';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Data presunta: $date · settimana $week, giorno $day';
  }

  @override
  String get begin => 'Inizia';

  @override
  String get nameRequired =>
      'Inserisci un nome (o un soprannome) per il tuo bebè.';

  @override
  String get dateRequired => 'Seleziona la data.';

  @override
  String get settings => 'Impostazioni';

  @override
  String get language => 'Lingua';

  @override
  String get languageSystem => 'Lingua del telefono';

  @override
  String get privacyOptions => 'Opzioni privacy annunci';

  @override
  String get factoryReset => 'Ripristina tutti i dati';

  @override
  String get factoryResetTitle => 'Ripristina tutti i dati';

  @override
  String get factoryResetMessage =>
      'Tutti i dati di peso, farmaci, contatori, liste e foto verranno eliminati. Sei sicura?';

  @override
  String weekDay(int week, int day) {
    return 'Settimana $week, giorno $day';
  }

  @override
  String trimester(int n) {
    return '$n° trimestre';
  }

  @override
  String get daysPassed => 'giorni passati';

  @override
  String get daysLeft => 'giorni rimasti';

  @override
  String get dueDate => 'data presunta';

  @override
  String get babyToday => 'Il mio bebè oggi';

  @override
  String get motherToday => 'Mamma oggi';

  @override
  String dailyBabyTitle(int week) {
    return 'Il mio bebè · settimana $week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Mamma · settimana $week';
  }

  @override
  String get noInfoToday => 'Nessuna informazione per oggi.';

  @override
  String get ringBirth => 'Al parto';

  @override
  String get ringTests => 'Esami';

  @override
  String get ringNeeds => 'Acquisti';

  @override
  String get ringBag => 'Borsa';

  @override
  String get weightChange => 'Andamento del peso';

  @override
  String get tools => 'Strumenti';

  @override
  String get toolWeight => 'Peso';

  @override
  String get toolMedicine => 'Farmaci';

  @override
  String get toolKick => 'Conta calci';

  @override
  String get toolContraction => 'Contrazioni';

  @override
  String get toolNeeds => 'Lista nascita';

  @override
  String get toolBag => 'Borsa per l\'ospedale';

  @override
  String get toolTests => 'Esami medici';

  @override
  String get toolNames => 'Trova il nome';

  @override
  String get toolAlbum => 'Album foto';

  @override
  String get suggest => 'Invia un suggerimento';

  @override
  String get rate => 'Valuta l\'app';

  @override
  String get emailError => 'Impossibile aprire un\'app di posta.';

  @override
  String get suggestSubject => 'Suggerimento per l\'app Il Mio Bebè';

  @override
  String get suggestBody => 'Il tuo suggerimento:';

  @override
  String get weightStart => 'Il tuo peso iniziale';

  @override
  String get weightToday => 'Il tuo peso di oggi';

  @override
  String get weightHint => 'es. 62,5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => 'Aggiungi peso';

  @override
  String get weightClearTitle => 'Dati del peso';

  @override
  String get weightClearMessage =>
      'Tutte le registrazioni del peso verranno eliminate.';

  @override
  String get weightEmpty =>
      'Nessuna registrazione. Inserisci il tuo peso iniziale per cominciare.';

  @override
  String totalChange(String value) {
    return 'Variazione totale: $value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'Settimana $week · $date';
  }

  @override
  String get medAdd => 'Aggiungi farmaco';

  @override
  String get medEmpty =>
      'Aggiungi i tuoi farmaci: te li ricorderemo ogni giorno all\'ora scelta.';

  @override
  String get medNew => 'Nuovo farmaco';

  @override
  String get medEdit => 'Modifica farmaco';

  @override
  String get medName => 'Nome del farmaco';

  @override
  String get medTime => 'Ora';

  @override
  String get medReminderOn => 'Promemoria attivo';

  @override
  String medDaily(String time, String meal) {
    return 'Ogni giorno $time · $meal';
  }

  @override
  String get mealEmpty => 'A digiuno';

  @override
  String get mealFull => 'Dopo i pasti';

  @override
  String get mealAny => 'Indifferente';

  @override
  String notifTitle(String name) {
    return 'Farmaco: $name';
  }

  @override
  String get notifEmpty => 'Ricorda di prenderlo a digiuno';

  @override
  String get notifFull => 'Ricorda di prenderlo dopo il pasto';

  @override
  String get notifAny => 'È ora del tuo farmaco';

  @override
  String get notifChannel => 'Promemoria farmaci';

  @override
  String get notifChannelDesc => 'Promemoria agli orari dei farmaci';

  @override
  String get notifPermissionDenied =>
      'Permesso di notifica negato: il promemoria non suonerà.';

  @override
  String get kickIdle => 'calci';

  @override
  String get kickTap => 'CALCIO!';

  @override
  String get stopAndSave => 'Termina e salva';

  @override
  String get kickHelp =>
      'Tocca il cerchio ogni volta che il bebè si muove. Indicazione generale: 10 movimenti in 2 ore. Se sei preoccupata, parlane con il tuo medico.';

  @override
  String get kickEmpty => 'Nessuna sessione salvata.';

  @override
  String kickRow(int count, String duration) {
    return '$count calci · $duration';
  }

  @override
  String get contractionRunning => 'Contrazione in corso';

  @override
  String get contractionIdle => 'Tocca quando inizia una contrazione';

  @override
  String get contractionStartBtn => 'INIZIO';

  @override
  String get contractionStopBtn => 'FINE';

  @override
  String get contractionHelp =>
      'Se le contrazioni sono regolari e sempre più ravvicinate (ad es. ogni 5 minuti, della durata di 1 minuto), contatta il tuo medico o l\'ospedale.';

  @override
  String get contractionEmpty => 'Nessuna contrazione salvata.';

  @override
  String contractionDuration(String duration) {
    return 'Durata $duration';
  }

  @override
  String contractionGap(String duration) {
    return '$duration dalla precedente';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'Ultima ora: $count contrazioni · durata media $length, ogni $minutes minuti';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total completati';
  }

  @override
  String get addItem => 'Aggiungi voce';

  @override
  String get newItem => 'Nuova voce';

  @override
  String get customGroup => 'Le mie voci';

  @override
  String get testsDisclaimer =>
      'Questo elenco ha solo scopo informativo; chiedi al tuo medico il calendario di esami adatto a te.';

  @override
  String get namesTitle => 'Il nome del mio bebè';

  @override
  String get spinning => 'La ruota gira…';

  @override
  String get namesHint => 'Tocca la ruota o scuoti il telefono';

  @override
  String get nameError => 'Impossibile ottenere un nome.';

  @override
  String get shareAll => 'Condividi tutto';

  @override
  String get ultrasoundPhoto => 'Foto dell\'ecografia';

  @override
  String get takePhoto => 'Scatta una foto';

  @override
  String get pickGallery => 'Scegli dalla galleria';

  @override
  String get share => 'Condividi';

  @override
  String get remove => 'Rimuovi';

  @override
  String get photoError =>
      'Impossibile ottenere la foto. Controlla i permessi.';

  @override
  String get addPhotosFirst => 'Aggiungi prima delle foto all\'album.';

  @override
  String photoN(int n) {
    return 'Foto $n';
  }

  @override
  String get shareText => 'L\'ecografia del mio bebè';

  @override
  String get shareAllText => 'L\'album delle ecografie del mio bebè';

  @override
  String get chartBaby => 'Bebè (stimato)';

  @override
  String get chartMother => 'Mamma';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return 'Peso stimato del bebè: $value';
  }

  @override
  String get babyWeightTooEarly =>
      'Il peso del bebè è mostrato dalla settimana 8.';

  @override
  String get babyWeightNote =>
      'Sono valori medi; ogni bebè cresce in modo diverso. Chiedi al tuo medico.';

  @override
  String get babyBornQuestion => 'Il tuo bebè è nato? 🎉';

  @override
  String get babyBornAction => 'Il mio bebè è nato';

  @override
  String get babyBornTitle => 'Benvenuto, piccolo!';

  @override
  String get birthDateLabel => 'Data di nascita';

  @override
  String get birthWeight => 'Peso alla nascita (kg)';

  @override
  String get birthLength => 'Lunghezza alla nascita (cm)';

  @override
  String get optional => 'facoltativo';

  @override
  String get backToPregnancy => 'Torna alla modalità gravidanza';

  @override
  String get weeklyNotifSetting => 'Notifiche settimanali';

  @override
  String get weeklyNotifChannel => 'Aggiornamenti settimanali';

  @override
  String weeklyNotifTitle(int week) {
    return 'Benvenuta nella settimana $week 💕';
  }

  @override
  String get weeklyNotifBody =>
      'Le informazioni di questa settimana sono pronte.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name ha $month mesi! 🎉';
  }

  @override
  String get monthlyNotifBody => 'Scopri lo sviluppo di questo mese.';

  @override
  String babyAge(int months, int days) {
    return '$months mesi $days gg';
  }

  @override
  String monthTitle(int month) {
    return 'Sviluppo del $month° mese';
  }

  @override
  String get newbornTitle => 'Periodo neonatale';

  @override
  String get showMore => 'Leggi di più';

  @override
  String get lastFeeding => 'ultima poppata';

  @override
  String get diapersToday => 'pannolini oggi';

  @override
  String get sleepToday => 'sonno oggi';

  @override
  String agoHM(int h, int m) {
    return '$h h $m min fa';
  }

  @override
  String agoM(int m) {
    return '$m min fa';
  }

  @override
  String durationHM(int h, int m) {
    return '$h h $m min';
  }

  @override
  String get toolFeeding => 'Poppate';

  @override
  String get toolDiaper => 'Pannolini';

  @override
  String get toolSleep => 'Sonno';

  @override
  String get toolGrowth => 'Crescita';

  @override
  String get breastLeft => 'Sinistro';

  @override
  String get breastRight => 'Destro';

  @override
  String get bottle => 'Biberon';

  @override
  String get solid => 'Pappe';

  @override
  String get tapToStop => 'Tocca di nuovo lo stesso lato per terminare';

  @override
  String get bottleAmount => 'Quantità biberon';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => 'Oggi';

  @override
  String feedCount(int count) {
    return '$count poppate';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Allattamento $minutes min';
  }

  @override
  String bottleTotal(int ml) {
    return 'Biberon $ml ml';
  }

  @override
  String get diaperWet => 'Bagnato';

  @override
  String get diaperDirty => 'Sporco';

  @override
  String get diaperBoth => 'Entrambi';

  @override
  String diaperCount(int count) {
    return '$count pannolini';
  }

  @override
  String get sleepStart => 'Addormentato';

  @override
  String get sleepStop => 'Sveglio';

  @override
  String get sleepRunning => 'Dorme';

  @override
  String sleepTotal(String duration) {
    return 'Totale oggi $duration';
  }

  @override
  String get growthAdd => 'Aggiungi misura';

  @override
  String get growthWeight => 'Peso (kg)';

  @override
  String get growthLength => 'Lunghezza (cm)';

  @override
  String get growthHead => 'Circonferenza cranica (cm)';

  @override
  String get growthHeadShort => 'Testa';

  @override
  String get growthEmpty =>
      'Nessuna misura. Aggiungi i valori misurati ai controlli.';

  @override
  String get whoMedian => 'Media OMS';

  @override
  String get babyWeightLabel => 'Peso del bebè';

  @override
  String monthAxis(int month) {
    return '$month mesi';
  }

  @override
  String get otherTools => 'Altri strumenti';

  @override
  String get noRecords => 'Nessun dato.';

  @override
  String get dailyMsgSetting => 'Messaggi del buongiorno';
}
