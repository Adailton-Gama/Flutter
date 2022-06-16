void main() {
  saudacoesnull('Adailton', cliente: 'Vinicius');
}

String agora() {
  DateTime agora = DateTime.now();
  return agora.toString();
}

void saudacoesnull(
  String nome, {
  bool mostrarAgora = true,
  String? cliente,
}) {
  print('Saudações do ${nome.toUpperCase()}');

  if (cliente != null) {
    print('Seja bem-vindo(a), ${cliente.toUpperCase()}!');
  }

  //NULLAWARE
  String c = cliente ?? 'Não informado';
  print('Seja bem-vindo(a), ${c.toUpperCase()}!');

  if (mostrarAgora) {
    print('Agora: ${agora()}');
  }
}
