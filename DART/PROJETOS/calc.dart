void main(){
  final String conta;
  var res;
  conta = '100x6';

  if (conta.contains('+')){
  int operadorPos = conta.indexOf('+');
    int fim = conta.length;
    int val1 = int.parse(conta.substring(0, operadorPos));
    int val2 = int.parse(conta.substring(operadorPos + 1, fim));
    res = val1 + val2;
    print('A soma dos valores é: ${res}');

  }else if(conta.contains('-')){
  
  int operadorPos = conta.indexOf('-');
  int fim = conta.length;
  int val1 = int.parse(conta.substring(0, operadorPos));
  int val2 = int.parse(conta.substring(operadorPos + 1, fim));
  res = val1 - val2;
  print('A soma dos valores é: ${res}');

  }else if(conta.contains('/')){
  int operadorPos = conta.indexOf('/');
    int fim = conta.length;
    int val1 = int.parse(conta.substring(0, operadorPos));
    int val2 = int.parse(conta.substring(operadorPos + 1, fim));
    res = val1 / val2;
    print('A soma dos valores é: ${res}');

  }else if(conta.contains('x')){
  int operadorPos = conta.indexOf('x');
  int fim = conta.length;
  int val1 = int.parse(conta.substring(0, operadorPos));
  int val2 = int.parse(conta.substring(operadorPos + 1, fim));
  res = val1 * val2;
  print('A soma dos valores é: ${res}');

  }else{
    print('nenhuma operação encontrada');
  }

}