// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class LPt extends L {
  LPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Meu Bebê';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Salvar';

  @override
  String get delete => 'Excluir';

  @override
  String get add => 'Adicionar';

  @override
  String get deleteAll => 'Excluir tudo';

  @override
  String get saved => 'Salvo';

  @override
  String get swipeToDelete => 'Deslize para a esquerda para excluir.';

  @override
  String get history => 'Histórico';

  @override
  String get start => 'Iniciar';

  @override
  String weekAxis(int week) {
    return 'sem $week';
  }

  @override
  String get welcomeTitle => 'Bem-vinda';

  @override
  String get welcomeSubtitle =>
      'Precisamos de algumas informações para acompanhar sua gravidez semana a semana.';

  @override
  String get babyName => 'Nome do bebê';

  @override
  String get sexLabel => 'Sexo';

  @override
  String get sexGirl => 'Menina';

  @override
  String get sexBoy => 'Menino';

  @override
  String get sexUnknown => 'Ainda não se sabe';

  @override
  String get kinLabel => 'Para o bebê, você é...';

  @override
  String get kinMother => 'A mãe';

  @override
  String get kinFather => 'O pai';

  @override
  String get kinAuntMaternal => 'A tia (lado materno)';

  @override
  String get kinAuntPaternal => 'A tia (lado paterno)';

  @override
  String get kinUncleMaternal => 'O tio (lado materno)';

  @override
  String get kinUnclePaternal => 'O tio (lado paterno)';

  @override
  String get kinSibling => 'Irmão ou irmã';

  @override
  String get kinGrandmother => 'A avó';

  @override
  String get kinGrandfather => 'O avô';

  @override
  String get kinOther => 'Um parente';

  @override
  String get whichDate => 'Qual data você sabe?';

  @override
  String get lastPeriod => 'Última menstruação';

  @override
  String get dueDateShort => 'Data prevista';

  @override
  String get lastPeriodLong => 'Primeiro dia da última menstruação';

  @override
  String get dueDateLong => 'Data prevista do parto';

  @override
  String get tapToSelect => 'Toque para escolher';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Data prevista: $date · semana $week, dia $day';
  }

  @override
  String get begin => 'Começar';

  @override
  String get nameRequired => 'Digite um nome (ou apelido) para o seu bebê.';

  @override
  String get dateRequired => 'Escolha a data.';

  @override
  String get settings => 'Configurações';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Idioma do telefone';

  @override
  String get privacyOptions => 'Opções de privacidade de anúncios';

  @override
  String get factoryReset => 'Apagar todos os dados';

  @override
  String get factoryResetTitle => 'Apagar todos os dados';

  @override
  String get factoryResetMessage =>
      'Todos os seus dados de peso, remédios, contadores, listas e fotos serão apagados. Tem certeza?';

  @override
  String weekDay(int week, int day) {
    return 'Semana $week, dia $day';
  }

  @override
  String trimester(int n) {
    return '$nº trimestre';
  }

  @override
  String get daysPassed => 'dias passados';

  @override
  String get daysLeft => 'dias restantes';

  @override
  String get dueDate => 'data prevista';

  @override
  String get babyToday => 'Meu bebê hoje';

  @override
  String get motherToday => 'Mamãe hoje';

  @override
  String dailyBabyTitle(int week) {
    return 'Meu bebê · semana $week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Mamãe · semana $week';
  }

  @override
  String get noInfoToday => 'Nenhuma informação para hoje.';

  @override
  String get ringBirth => 'Até o parto';

  @override
  String get ringTests => 'Exames';

  @override
  String get ringNeeds => 'Enxoval';

  @override
  String get ringBag => 'Mala';

  @override
  String get weightChange => 'Evolução do peso';

  @override
  String get tools => 'Ferramentas';

  @override
  String get toolWeight => 'Controle de peso';

  @override
  String get toolMedicine => 'Remédios';

  @override
  String get toolKick => 'Contador de chutes';

  @override
  String get toolContraction => 'Contrações';

  @override
  String get toolNeeds => 'Enxoval do bebê';

  @override
  String get toolBag => 'Mala da maternidade';

  @override
  String get toolTests => 'Exames médicos';

  @override
  String get toolNames => 'Escolher nome';

  @override
  String get toolAlbum => 'Álbum de fotos';

  @override
  String get suggest => 'Enviar sugestão';

  @override
  String get rate => 'Avaliar';

  @override
  String get emailError => 'Não foi possível abrir um app de e-mail.';

  @override
  String get suggestSubject => 'Sugestão para o app Meu Bebê';

  @override
  String get suggestBody => 'Sua sugestão:';

  @override
  String get weightStart => 'Seu peso inicial';

  @override
  String get weightToday => 'Seu peso hoje';

  @override
  String get weightHint => 'ex.: 62,5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => 'Adicionar peso';

  @override
  String get weightClearTitle => 'Dados de peso';

  @override
  String get weightClearMessage =>
      'Todos os seus registros de peso serão apagados.';

  @override
  String get weightEmpty =>
      'Nenhum registro ainda. Informe seu peso inicial para começar.';

  @override
  String totalChange(String value) {
    return 'Variação total: $value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'Semana $week · $date';
  }

  @override
  String get medAdd => 'Adicionar remédio';

  @override
  String get medEmpty =>
      'Adicione seus remédios e vamos lembrar você todos os dias no horário escolhido.';

  @override
  String get medNew => 'Novo remédio';

  @override
  String get medEdit => 'Editar remédio';

  @override
  String get medName => 'Nome do remédio';

  @override
  String get medTime => 'Horário';

  @override
  String get medReminderOn => 'Lembrete ativado';

  @override
  String medDaily(String time, String meal) {
    return 'Todos os dias $time · $meal';
  }

  @override
  String get mealEmpty => 'Em jejum';

  @override
  String get mealFull => 'Após a refeição';

  @override
  String get mealAny => 'Tanto faz';

  @override
  String notifTitle(String name) {
    return 'Remédio: $name';
  }

  @override
  String get notifEmpty => 'Lembre-se de tomar em jejum';

  @override
  String get notifFull => 'Lembre-se de tomar após a refeição';

  @override
  String get notifAny => 'Hora do seu remédio';

  @override
  String get notifChannel => 'Lembrete de remédio';

  @override
  String get notifChannelDesc => 'Lembretes nos horários dos remédios';

  @override
  String get notifPermissionDenied =>
      'Permissão de notificação negada; o lembrete não vai tocar.';

  @override
  String get kickIdle => 'chutes';

  @override
  String get kickTap => 'CHUTE!';

  @override
  String get stopAndSave => 'Encerrar e salvar';

  @override
  String get kickHelp =>
      'Toque no círculo sempre que o bebê se mexer. Referência geral: 10 movimentos em 2 horas. Se ficar preocupada, fale com seu médico.';

  @override
  String get kickEmpty => 'Nenhuma sessão salva.';

  @override
  String kickRow(int count, String duration) {
    return '$count chutes · $duration';
  }

  @override
  String get contractionRunning => 'Contração em andamento';

  @override
  String get contractionIdle => 'Toque quando uma contração começar';

  @override
  String get contractionStartBtn => 'COMEÇOU';

  @override
  String get contractionStopBtn => 'TERMINOU';

  @override
  String get contractionHelp =>
      'Se as contrações estiverem regulares e cada vez mais próximas (por ex. a cada 5 minutos, durando 1 minuto), procure seu médico.';

  @override
  String get contractionEmpty => 'Nenhuma contração salva.';

  @override
  String contractionDuration(String duration) {
    return 'Duração $duration';
  }

  @override
  String contractionGap(String duration) {
    return '$duration desde a anterior';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'Última hora: $count contrações · duração média de $length, a cada $minutes minutos';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total concluídos';
  }

  @override
  String get addItem => 'Adicionar item';

  @override
  String get newItem => 'Novo item';

  @override
  String get customGroup => 'Meus itens';

  @override
  String get testsDisclaimer =>
      'Esta lista é apenas informativa; peça ao seu médico o seu calendário pessoal de exames.';

  @override
  String get namesTitle => 'O nome do meu bebê';

  @override
  String get spinning => 'A roda está girando…';

  @override
  String get namesHint => 'Toque na roda ou agite o celular';

  @override
  String get nameError => 'Não foi possível obter um nome.';

  @override
  String get shareAll => 'Compartilhar tudo';

  @override
  String get ultrasoundPhoto => 'Foto do ultrassom';

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get pickGallery => 'Escolher da galeria';

  @override
  String get share => 'Compartilhar';

  @override
  String get remove => 'Remover';

  @override
  String get photoError =>
      'Não foi possível obter a foto. Verifique as permissões.';

  @override
  String get addPhotosFirst => 'Adicione fotos ao álbum primeiro.';

  @override
  String photoN(int n) {
    return 'Foto $n';
  }

  @override
  String get shareText => 'O ultrassom do meu bebê';

  @override
  String get shareAllText => 'O álbum de ultrassons do meu bebê';

  @override
  String get chartBaby => 'Bebê (estimado)';

  @override
  String get chartMother => 'Mamãe';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return 'Peso estimado do bebê: $value';
  }

  @override
  String get babyWeightTooEarly =>
      'O peso do bebê aparece a partir da semana 8.';

  @override
  String get babyWeightNote =>
      'São médias; cada bebê cresce de um jeito. Consulte seu médico.';

  @override
  String get babyBornQuestion => 'Seu bebê nasceu? 🎉';

  @override
  String get babyBornAction => 'Meu bebê nasceu';

  @override
  String get babyBornTitle => 'Bem-vindo, pequeno!';

  @override
  String get birthDateLabel => 'Data de nascimento';

  @override
  String get birthWeight => 'Peso ao nascer (kg)';

  @override
  String get birthLength => 'Comprimento ao nascer (cm)';

  @override
  String get optional => 'opcional';

  @override
  String get backToPregnancy => 'Voltar ao modo gravidez';

  @override
  String get weeklyNotifSetting => 'Notificações semanais';

  @override
  String get weeklyNotifChannel => 'Novidades da semana';

  @override
  String weeklyNotifTitle(int week) {
    return 'Bem-vinda à semana $week 💕';
  }

  @override
  String get weeklyNotifBody => 'As informações desta semana estão prontas.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name fez $month meses! 🎉';
  }

  @override
  String get monthlyNotifBody => 'Veja o desenvolvimento deste mês.';

  @override
  String babyAge(int months, int days) {
    return '$months m $days d';
  }

  @override
  String monthTitle(int month) {
    return 'Desenvolvimento do $monthº mês';
  }

  @override
  String get newbornTitle => 'Período de recém-nascido';

  @override
  String get showMore => 'Ler mais';

  @override
  String get lastFeeding => 'última mamada';

  @override
  String get diapersToday => 'fraldas hoje';

  @override
  String get sleepToday => 'sono hoje';

  @override
  String agoHM(int h, int m) {
    return 'há $h h $m min';
  }

  @override
  String agoM(int m) {
    return 'há $m min';
  }

  @override
  String durationHM(int h, int m) {
    return '$h h $m min';
  }

  @override
  String get toolFeeding => 'Alimentação';

  @override
  String get toolDiaper => 'Fraldas';

  @override
  String get toolSleep => 'Sono';

  @override
  String get toolGrowth => 'Crescimento';

  @override
  String get breastLeft => 'Esquerdo';

  @override
  String get breastRight => 'Direito';

  @override
  String get bottle => 'Mamadeira';

  @override
  String get solid => 'Papinhas';

  @override
  String get tapToStop => 'Toque o mesmo lado de novo para terminar';

  @override
  String get bottleAmount => 'Quantidade da mamadeira';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => 'Hoje';

  @override
  String feedCount(int count) {
    return '$count mamadas';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Amamentação $minutes min';
  }

  @override
  String bottleTotal(int ml) {
    return 'Mamadeira $ml ml';
  }

  @override
  String get diaperWet => 'Xixi';

  @override
  String get diaperDirty => 'Cocô';

  @override
  String get diaperBoth => 'Os dois';

  @override
  String diaperCount(int count) {
    return '$count fraldas';
  }

  @override
  String get sleepStart => 'Dormiu';

  @override
  String get sleepStop => 'Acordou';

  @override
  String get sleepRunning => 'Dormindo';

  @override
  String sleepTotal(String duration) {
    return 'Total hoje $duration';
  }

  @override
  String get growthAdd => 'Adicionar medida';

  @override
  String get growthWeight => 'Peso (kg)';

  @override
  String get growthLength => 'Comprimento (cm)';

  @override
  String get growthHead => 'Perímetro cefálico (cm)';

  @override
  String get growthHeadShort => 'Cabeça';

  @override
  String get growthEmpty =>
      'Nenhuma medida ainda. Adicione os valores das consultas.';

  @override
  String get whoMedian => 'Média OMS';

  @override
  String get babyWeightLabel => 'Peso do bebê';

  @override
  String monthAxis(int month) {
    return '$month m';
  }

  @override
  String get otherTools => 'Outras ferramentas';

  @override
  String get noRecords => 'Nenhum registro ainda.';

  @override
  String get dailyMsgSetting => 'Mensagens de bom dia';

  @override
  String get premiumTitle => 'Remover anúncios';

  @override
  String get premiumDesc =>
      'Use o app sem anúncios com um pagamento único. A compra também vale nos seus outros aparelhos com a mesma conta.';

  @override
  String premiumBuy(String price) {
    return 'Sem anúncios – $price';
  }

  @override
  String get premiumBuyNoPrice => 'A loja não está disponível agora';

  @override
  String get premiumRestore => 'Restaurar compra';

  @override
  String get premiumActive =>
      'A versão sem anúncios está ativa. Obrigado pelo apoio 💕';

  @override
  String get premiumUnavailable =>
      'Não foi possível concluir a compra. Tente novamente mais tarde.';

  @override
  String get premiumThanks => 'Obrigado! Você não verá mais anúncios 💕';
}
