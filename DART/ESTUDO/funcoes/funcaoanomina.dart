void main() {
  saudacoes('Adailton', corpo: (int i){
    for (int j = 0; j <= i; j++) {
      print('Ola $j');
    }
  }, cliente: 'Vinicius');
}

String agora() {
  DateTime agora = DateTime.now();
  return agora.toString();
}

void saudacoes(String nome,
    {bool mostrarAgora = true, String? cliente, required Function(int) corpo}) {
  print('Saudações do ${nome.toUpperCase()}');

  //Funções por parametro
  corpo(10);

  //NULL-AWARE
  String c = cliente ?? 'Não informado';
  print('Seja bem-vindo(a), ${c.toUpperCase()}!');

  if (mostrarAgora) {
    print('Agora: ${agora()}');
  }
}
