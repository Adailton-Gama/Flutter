void main() {
  Cachorro cachorro1 = Cachorro('Spyke', 2);
  print(cachorro1); //Isso acontece porque nativamente existe um toString(), quando pedimos para printar o objeto, e como sobrescrevemos o toString na classe e retorna os dados que colocamos lá
  cachorro1.Latir();
  cachorro1.Dormir();
  print('');


  Gato gato1 = Gato('Tenten', 2);
  print(gato1);
  gato1.Comer();
  gato1.Miar();
  gato1.Dormir();
  print('');
  List<Animal> animais = [];
  animais.add(gato1);
  animais.add(cachorro1);

  Animal animal1 = animais.first;
  if (animal1 is Gato) {
    print('A ${animal1.nome}, fez: ${animal1.Miar()}');
  } else if (animal1 is Cachorro) {
    animal1.Latir();
  }

  Animal animal2 = funcao();
  if (animal2 is Cachorro){
    animal2.Latir();
  }else if (animal2 is Gato){
    animal2.Miar();
  }

}

class Animal {

  Animal (this.nome, this.idade);
  String? nome;
  int? idade;

  void Comer() {
    print('Comeu');
  }

  void Dormir() {
    print('Dormiu');
  }

  @override
  String toString(){
    return 'Nome : $nome, Idade: $idade';
  }
}

class Cachorro extends Animal {
  Cachorro(String nome, int idade) : super(nome, idade){
    print('Cachorro cadastrado com sucesso!');
  }
  void Latir() {
    print('Au Au');
  }
  
  @override
  void Dormir(){
    //Keywords
    super.Dormir();
    print('roncando muito!!!');
  }
  @override
  String toString() {
    return 'Cachorro - Nome : $nome, Idade: $idade';
  }
}

class Gato extends Animal {
  Gato (String nome, int idade) : super(nome, idade){
    print('Gato cadastrado com sucesso!');
  }
  String Miar() {
    return 'miauu';
  }
  @override
  String toString() {
    return 'Gato - Nome : $nome, Idade: $idade';
  }
}

Animal funcao(){
  return Cachorro('sebastião', 10);
}