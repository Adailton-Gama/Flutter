void main() {
  List<String> nomes = [
    'Adailton',
    'Gama',
    'Vinicius',
    'Bruno',
    'Abraão',
  ];
  print(nomes);

  print('');
  print('Usando for: int i = 0; i < nomes.length; i++');
  for (int i = 0; i < nomes.length; i++) {
    print(nomes[i].toUpperCase());
  }

  print('');
  print('Usando String nome in nomes.sublist(2)');
  for (String nome in nomes.sublist(2)) {
    print(nome.toUpperCase());
  } //Sublist ele define a partir e qual posição ele vai percorrer
  
  print('');
  print('Usando nomes.forEach((nome) ');
  nomes.forEach((nome) {
    print(nome.toUpperCase());
  });

print('');
  print('nomes.sublist(2).forEach((nome) {');
  nomes.sublist(2).forEach((nome) {
    print(nome.toUpperCase());
  });
}
