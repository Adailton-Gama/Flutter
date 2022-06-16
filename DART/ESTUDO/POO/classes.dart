import 'dart:io';
void main(){
  print('criado através de uma função');
  criarpessoa(nome:'Adailton', nomeCompleto: 'Adailton Gama Santana', idade: 23); // criado através de uma função
  print('');

  print('criado direto da classe');
  Pessoa Naine = Pessoa(nome: 'Naine', idade: 20); // criado direto da classe
  Naine.altura = 1.60;

  print('Dados da ${Naine.nome}, nome: ${Naine.nome}, idade: ${Naine.idade}, altura: ${Naine.altura}');

}


void criarpessoa({required String nome, required String nomeCompleto, required int idade}) {
  late String nomePessoa;
  nomePessoa = nome;
  if (nomePessoa != null) {
    Pessoa nomePessoa = Pessoa(nome: nomeCompleto, idade: idade);
    print(nomePessoa.nome);
    print(nomePessoa.idade);
  }
}

class Pessoa{
  Pessoa({required this.nome, required this.idade});
  String nome;
  int idade;
  late double altura;
}
