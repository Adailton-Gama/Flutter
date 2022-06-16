void main(){
  Cachorro cachorro1 = Cachorro();
  cachorro1.nome = 'Spyke';
  cachorro1.idade = 2;
  cachorro1.Latir();
  cachorro1.Dormir();
  print('');

  Gato gato1 = Gato();
  gato1.nome = 'Tenten';
  gato1.idade = 2;
  gato1.Comer();
  gato1.Miar();
  gato1.Dormir();

  List<Animal> animais = [];
  animais.add(gato1);
  animais.add(cachorro1);

  Animal animal1 = animais.first;
  if (animal1 is Gato){
    animal1.Miar();
  }else if (animal1 is Cachorro){
    animal1.Latir();
  }
}

class Animal{
  String? nome;
  int? idade;

  void Comer() {
    print('Comeu');
  }

  void Dormir() {
    print('Dormiu');
  }
}

class Cachorro extends Animal{
  
  void Latir(){
    print('Au Au');
  }
}

class Gato extends Animal{
  void Miar(){
    print('miauu');
  }
}