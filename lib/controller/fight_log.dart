import '../model/fighter.dart';

Stream<List<String>> fightLog(Fighter one, Fighter two) async* {
  final history = [
    '${one.name} VS ${two.name} &\n &\n The fight will start in 3 seconds... &\n'
  ];
  yield history;
  await Future.delayed(Duration(seconds: 2));
  history.add('3...');
  yield history;
  await Future.delayed(Duration(seconds: 1));
  history.add(' 2...');
  yield history;
  await Future.delayed(Duration(seconds: 1));
  history.add(' 1... &\n');
  yield history;
  await Future.delayed(Duration(seconds: 1));
  history.add('FIGHT!!!');
  yield history;
  await Future.delayed(Duration(seconds: 1));

  while (one.life != 0 && two.life != 0) {
    history.add(' &\n ${two.attacked(one.damage(one), one)}');
    yield history;
    await Future.delayed(const Duration(seconds: 2));
    history.add(' &\n ${one.attacked(two.damage(two), two)}');
    yield history;
    await Future.delayed(const Duration(seconds: 2));
  }
}