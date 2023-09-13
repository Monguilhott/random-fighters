import 'dart:math';

class Fighter {
  String name;
  double life = 50;
  double maxLife = 50;
  int attack = Random().nextInt(10);
  int specialAttack = Random().nextInt(6) + 15;
  String image;
  String icon;
  String iconSelectScreen;
  bool bordaAtiva;

  String attacked(int damage, Fighter boneco) {
    String log = '';

    if (life >= 1 && boneco.life > 0) {
      boneco.attack = Random().nextInt(10);
      boneco.specialAttack = Random().nextInt(6) + 15;
      if (damage == 0) {
        log = ' &\n${boneco.name} errou o ataque!';
      } else {
        log = ' &\n${boneco.name} atacou e deu $damage de dano!';
      }
      life -= damage;
      if (life <= 0) {
        life = 0;
        log += died(boneco);
      } else {
        log += lifeAlert();
      }
    }
    return log;
  }

  int damage(Fighter boneco) {
    if (boneco.life > 0) {
      int roleta = Random().nextInt(10);
      if (roleta <= 7) {
        //print('Ataque Basico');
        return attack;
      } else {
        //print('Ataque Especial');
        return specialAttack;
      }
    } else {
      return 0;
    }
  }

  String lifeAlert() => ' &\n$name está com $life de vida!';

  String died(Fighter boneco) => ' &\n &\n $name morreu e ${boneco.name} venceu!';

  Fighter(this.name, this.image, this.icon, this.iconSelectScreen, {this.bordaAtiva = false});
}