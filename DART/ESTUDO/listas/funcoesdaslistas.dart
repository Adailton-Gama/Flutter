void main() {
  List<int> repeatnum = List.filled(100, 8);
  print(repeatnum);

  List<String> dados = List.filled(5,'Adailton');
  print(dados);

  //Com função
  List<int> randomlist = List.generate(10, funcao);
  print(randomlist);

  //com função anônima
 List<int> genNum = List.generate(10, (i) => i * 10);
  print(genNum);

  print(genNum.isEmpty);
  print(genNum.isNotEmpty);
  genNum.removeAt(0);
  print(genNum.any((i) => i % 20 == 0));
  print(genNum.firstWhere((i) => i % 40 == 0));
  print(genNum.lastWhere((i) => i % 40 == 0));

  print(genNum.where((i) => i % 40 == 0));

  print(genNum.map((i) => i + 1));

  print(genNum.map((i) {
    return 2 * 1;
  }));
}

int funcao(int pos){
  return pos * 10;
}