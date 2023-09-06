List<Scenarios> scenarios = [
  Scenarios('assets/background01.gif', 'audios/scenario01.mp3'),
  Scenarios('assets/background02.gif', 'audios/scenario02.mp3'),
  Scenarios('assets/background03.gif', 'audios/scenario03.mp3'),
  Scenarios('assets/background04.gif', 'audios/scenario04.mp3'),
  Scenarios('assets/background05.gif', 'audios/scenario05.mp3'),
  Scenarios('assets/background06.gif', 'audios/scenario06.mp3'),
  Scenarios('assets/background07.gif', 'audios/scenario07.mp3')
];

class Scenarios {
  String scenario;
  String music;

  Scenarios(this.scenario, this.music);
}
