// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class LEs extends L {
  LEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Mi Bebé';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get delete => 'Eliminar';

  @override
  String get add => 'Añadir';

  @override
  String get deleteAll => 'Eliminar todo';

  @override
  String get saved => 'Guardado';

  @override
  String get swipeToDelete => 'Desliza a la izquierda para eliminar.';

  @override
  String get history => 'Historial';

  @override
  String get start => 'Iniciar';

  @override
  String weekAxis(int week) {
    return 'sem $week';
  }

  @override
  String get welcomeTitle => 'Bienvenida';

  @override
  String get welcomeSubtitle =>
      'Necesitamos algunos datos para seguir tu embarazo semana a semana.';

  @override
  String get babyName => 'Nombre del bebé';

  @override
  String get sexLabel => 'Sexo';

  @override
  String get sexGirl => 'Niña';

  @override
  String get sexBoy => 'Niño';

  @override
  String get sexUnknown => 'Aún no se sabe';

  @override
  String get kinLabel => 'Para el bebé eres...';

  @override
  String get kinMother => 'La madre';

  @override
  String get kinFather => 'El padre';

  @override
  String get kinAuntMaternal => 'La tía (lado materno)';

  @override
  String get kinAuntPaternal => 'La tía (lado paterno)';

  @override
  String get kinUncleMaternal => 'El tío (lado materno)';

  @override
  String get kinUnclePaternal => 'El tío (lado paterno)';

  @override
  String get kinSibling => 'Hermano o hermana';

  @override
  String get kinGrandmother => 'La abuela';

  @override
  String get kinGrandfather => 'El abuelo';

  @override
  String get kinOther => 'Un familiar';

  @override
  String get whichDate => '¿Qué fecha conoces?';

  @override
  String get lastPeriod => 'Última regla';

  @override
  String get dueDateShort => 'Fecha prevista';

  @override
  String get lastPeriodLong => 'Primer día de la última regla';

  @override
  String get dueDateLong => 'Fecha prevista de parto';

  @override
  String get tapToSelect => 'Toca para elegir';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Fecha prevista: $date · semana $week, día $day';
  }

  @override
  String get begin => 'Empezar';

  @override
  String get nameRequired => 'Escribe un nombre (o apodo) para tu bebé.';

  @override
  String get dateRequired => 'Elige la fecha.';

  @override
  String get settings => 'Ajustes';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Idioma del teléfono';

  @override
  String get privacyOptions => 'Opciones de privacidad de anuncios';

  @override
  String get factoryReset => 'Borrar todos los datos';

  @override
  String get factoryResetTitle => 'Borrar todos los datos';

  @override
  String get factoryResetMessage =>
      'Se borrarán todos tus datos de peso, medicamentos, contadores, listas y fotos. ¿Estás segura?';

  @override
  String weekDay(int week, int day) {
    return 'Semana $week, día $day';
  }

  @override
  String trimester(int n) {
    return '$n.º trimestre';
  }

  @override
  String get daysPassed => 'días pasados';

  @override
  String get daysLeft => 'días restantes';

  @override
  String get dueDate => 'fecha prevista';

  @override
  String get babyToday => 'Mi bebé hoy';

  @override
  String get motherToday => 'Mamá hoy';

  @override
  String dailyBabyTitle(int week) {
    return 'Mi bebé · semana $week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Mamá · semana $week';
  }

  @override
  String get noInfoToday => 'No hay información para hoy.';

  @override
  String get ringBirth => 'Al parto';

  @override
  String get ringTests => 'Pruebas';

  @override
  String get ringNeeds => 'Compras';

  @override
  String get ringBag => 'Bolsa';

  @override
  String get weightChange => 'Evolución del peso';

  @override
  String get tools => 'Herramientas';

  @override
  String get toolWeight => 'Control de peso';

  @override
  String get toolMedicine => 'Medicamentos';

  @override
  String get toolKick => 'Contador de patadas';

  @override
  String get toolContraction => 'Contracciones';

  @override
  String get toolNeeds => 'Lista del bebé';

  @override
  String get toolBag => 'Bolsa del hospital';

  @override
  String get toolTests => 'Pruebas médicas';

  @override
  String get toolNames => 'Buscar nombre';

  @override
  String get toolAlbum => 'Álbum de fotos';

  @override
  String get suggest => 'Enviar sugerencia';

  @override
  String get rate => 'Valorar';

  @override
  String get emailError => 'No se pudo abrir una app de correo.';

  @override
  String get suggestSubject => 'Sugerencia para la app Mi Bebé';

  @override
  String get suggestBody => 'Tu sugerencia:';

  @override
  String get weightStart => 'Tu peso inicial';

  @override
  String get weightToday => 'Tu peso de hoy';

  @override
  String get weightHint => 'p. ej. 62,5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => 'Añadir peso';

  @override
  String get weightClearTitle => 'Datos de peso';

  @override
  String get weightClearMessage => 'Se borrarán todos tus registros de peso.';

  @override
  String get weightEmpty =>
      'Aún no hay registros. Introduce tu peso inicial para empezar.';

  @override
  String totalChange(String value) {
    return 'Cambio total: $value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'Semana $week · $date';
  }

  @override
  String get medAdd => 'Añadir medicamento';

  @override
  String get medEmpty =>
      'Añade tus medicamentos y te lo recordaremos cada día a la hora que elijas.';

  @override
  String get medNew => 'Nuevo medicamento';

  @override
  String get medEdit => 'Editar medicamento';

  @override
  String get medName => 'Nombre del medicamento';

  @override
  String get medTime => 'Hora';

  @override
  String get medReminderOn => 'Recordatorio activado';

  @override
  String medDaily(String time, String meal) {
    return 'Todos los días $time · $meal';
  }

  @override
  String get mealEmpty => 'En ayunas';

  @override
  String get mealFull => 'Después de comer';

  @override
  String get mealAny => 'Da igual';

  @override
  String notifTitle(String name) {
    return 'Medicamento: $name';
  }

  @override
  String get notifEmpty => 'Recuerda tomarlo en ayunas';

  @override
  String get notifFull => 'Recuerda tomarlo después de comer';

  @override
  String get notifAny => 'Es hora de tu medicamento';

  @override
  String get notifChannel => 'Recordatorio de medicamentos';

  @override
  String get notifChannelDesc => 'Recordatorios a la hora de las tomas';

  @override
  String get notifPermissionDenied =>
      'Permiso de notificaciones denegado; el recordatorio no sonará.';

  @override
  String get kickIdle => 'patadas';

  @override
  String get kickTap => '¡PATADA!';

  @override
  String get stopAndSave => 'Terminar y guardar';

  @override
  String get kickHelp =>
      'Toca el círculo cada vez que tu bebé se mueva. Referencia general: 10 movimientos en 2 horas. Si te preocupa algo, consulta a tu médico.';

  @override
  String get kickEmpty => 'No hay sesiones guardadas.';

  @override
  String kickRow(int count, String duration) {
    return '$count patadas · $duration';
  }

  @override
  String get contractionRunning => 'Contracción en curso';

  @override
  String get contractionIdle => 'Toca cuando empiece una contracción';

  @override
  String get contractionStartBtn => 'EMPEZÓ';

  @override
  String get contractionStopBtn => 'TERMINÓ';

  @override
  String get contractionHelp =>
      'Si las contracciones son regulares y cada vez más seguidas (p. ej., cada 5 minutos y de 1 minuto de duración), contacta con tu médico.';

  @override
  String get contractionEmpty => 'No hay contracciones guardadas.';

  @override
  String contractionDuration(String duration) {
    return 'Duración $duration';
  }

  @override
  String contractionGap(String duration) {
    return '$duration desde la anterior';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'Última hora: $count contracciones · duran $length de media, cada $minutes minutos';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total completados';
  }

  @override
  String get addItem => 'Añadir elemento';

  @override
  String get newItem => 'Nuevo elemento';

  @override
  String get customGroup => 'Mis elementos';

  @override
  String get testsDisclaimer =>
      'Esta lista es solo informativa; consulta a tu médico tu calendario personal de pruebas.';

  @override
  String get namesTitle => 'El nombre de mi bebé';

  @override
  String get spinning => 'La rueda gira…';

  @override
  String get namesHint => 'Toca la rueda o agita el teléfono';

  @override
  String get nameError => 'No se pudo obtener un nombre.';

  @override
  String get shareAll => 'Compartir todo';

  @override
  String get ultrasoundPhoto => 'Foto de ecografía';

  @override
  String get takePhoto => 'Hacer una foto';

  @override
  String get pickGallery => 'Elegir de la galería';

  @override
  String get share => 'Compartir';

  @override
  String get remove => 'Quitar';

  @override
  String get photoError => 'No se pudo obtener la foto. Revisa los permisos.';

  @override
  String get addPhotosFirst => 'Primero añade fotos al álbum.';

  @override
  String photoN(int n) {
    return 'Foto $n';
  }

  @override
  String get shareText => 'La ecografía de mi bebé';

  @override
  String get shareAllText => 'El álbum de ecografías de mi bebé';

  @override
  String get chartBaby => 'Bebé (estimado)';

  @override
  String get chartMother => 'Mamá';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return 'Peso estimado del bebé: $value';
  }

  @override
  String get babyWeightTooEarly =>
      'El peso del bebé se muestra desde la semana 8.';

  @override
  String get babyWeightNote =>
      'Son valores medios; cada bebé crece de forma distinta. Consulta a tu médico.';

  @override
  String get babyBornQuestion => '¿Ya nació tu bebé? 🎉';

  @override
  String get babyBornAction => 'Mi bebé ya nació';

  @override
  String get babyBornTitle => '¡Bienvenido, pequeño!';

  @override
  String get birthDateLabel => 'Fecha de nacimiento';

  @override
  String get birthWeight => 'Peso al nacer (kg)';

  @override
  String get birthLength => 'Talla al nacer (cm)';

  @override
  String get optional => 'opcional';

  @override
  String get backToPregnancy => 'Volver al modo embarazo';

  @override
  String get weeklyNotifSetting => 'Notificaciones semanales';

  @override
  String get weeklyNotifChannel => 'Novedades semanales';

  @override
  String weeklyNotifTitle(int week) {
    return 'Bienvenida a la semana $week 💕';
  }

  @override
  String get weeklyNotifBody => 'La información de esta semana está lista.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '¡$name cumple $month meses! 🎉';
  }

  @override
  String get monthlyNotifBody => 'Mira el desarrollo de este mes.';

  @override
  String babyAge(int months, int days) {
    return '$months m $days d';
  }

  @override
  String monthTitle(int month) {
    return 'Desarrollo del mes $month';
  }

  @override
  String get newbornTitle => 'Periodo de recién nacido';

  @override
  String get showMore => 'Leer más';

  @override
  String get lastFeeding => 'última toma';

  @override
  String get diapersToday => 'pañales hoy';

  @override
  String get sleepToday => 'sueño hoy';

  @override
  String agoHM(int h, int m) {
    return 'hace $h h $m min';
  }

  @override
  String agoM(int m) {
    return 'hace $m min';
  }

  @override
  String durationHM(int h, int m) {
    return '$h h $m min';
  }

  @override
  String get toolFeeding => 'Tomas';

  @override
  String get toolDiaper => 'Pañales';

  @override
  String get toolSleep => 'Sueño';

  @override
  String get toolGrowth => 'Crecimiento';

  @override
  String get breastLeft => 'Izquierdo';

  @override
  String get breastRight => 'Derecho';

  @override
  String get bottle => 'Biberón';

  @override
  String get solid => 'Sólidos';

  @override
  String get tapToStop => 'Toca el mismo lado para terminar';

  @override
  String get bottleAmount => 'Cantidad del biberón';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => 'Hoy';

  @override
  String feedCount(int count) {
    return '$count tomas';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Lactancia $minutes min';
  }

  @override
  String bottleTotal(int ml) {
    return 'Biberón $ml ml';
  }

  @override
  String get diaperWet => 'Mojado';

  @override
  String get diaperDirty => 'Sucio';

  @override
  String get diaperBoth => 'Ambos';

  @override
  String diaperCount(int count) {
    return '$count pañales';
  }

  @override
  String get sleepStart => 'Se durmió';

  @override
  String get sleepStop => 'Se despertó';

  @override
  String get sleepRunning => 'Durmiendo';

  @override
  String sleepTotal(String duration) {
    return 'Total hoy $duration';
  }

  @override
  String get growthAdd => 'Añadir medida';

  @override
  String get growthWeight => 'Peso (kg)';

  @override
  String get growthLength => 'Talla (cm)';

  @override
  String get growthHead => 'Perímetro cefálico (cm)';

  @override
  String get growthHeadShort => 'Cabeza';

  @override
  String get growthEmpty =>
      'Aún no hay medidas. Añade los valores de las revisiones.';

  @override
  String get whoMedian => 'Media OMS';

  @override
  String get babyWeightLabel => 'Peso del bebé';

  @override
  String monthAxis(int month) {
    return '$month m';
  }

  @override
  String get otherTools => 'Otras herramientas';

  @override
  String get noRecords => 'Aún no hay registros.';

  @override
  String get dailyMsgSetting => 'Mensajes de buenos días';
}
