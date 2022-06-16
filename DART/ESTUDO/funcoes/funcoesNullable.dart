void main() {
  String nome = funcao();
  print(nome);
  String ola = funcao2(11) ?? 'Não informado!';
  print(ola.toUpperCase());
}

String funcao() => 'Adailton'.toUpperCase();

String? funcao2(int x){
  if (x >10){
    return 'Olá mundo!';
  }
}