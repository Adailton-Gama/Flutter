import 'dart:io';
void main(){
    print('MENU');
    print('');
    print('1 - MAÇÃ');
    print('2 - LARANJA');
    print('3 - BANANA');
    print('');
    print('Escolha a fruta que deseja comprar:');

    double preco_1 = 2.30;
    double preco_2 = 3.60;
    double preco_3 = 1.80;

    int esc_fruta = int.parse(stdin.readLineSync()!);
    print('');

    var fruta;

    if (esc_fruta == 1){
      print('Quantas unidades deseja comprar?');
      double qtd = double.parse(stdin.readLineSync()!);
      fruta = 'Maçãs';
      var precototal1 = qtd * 2.3;
      String sprecototal = precototal1.toStringAsFixed(2);
      var precototal = double.parse(sprecototal);
      print('Você comprou $qtd $fruta, o valor a ser pago é: R\$ $precototal');

    }else if(esc_fruta == 2){
      print('Quantas unidades deseja comprar?');
      double qtd = double.parse(stdin.readLineSync()!);
      fruta = 'Laranjas';
      var precototal1 = qtd * 3.60;
      String sprecototal = precototal1.toStringAsFixed(2);
      var precototal = double.parse(sprecototal);
      print('Você comprou $qtd $fruta, o valor a ser pago é R\$ $precototal');

    }else if(esc_fruta==3){
      print('Quantas unidades deseja comprar?');
      double qtd = double.parse(stdin.readLineSync()!);
      fruta = 'Bananas';
      var precototal1 = qtd * 1.85;
      String sprecototal = precototal1.toStringAsFixed(2);
      print('Você comprou $qtd $fruta, o valor a ser pago é R\$ $sprecototal');
      var precototal = double.parse(sprecototal);
      precototal*1;
    }else{
      print('Fruta inexistente!');
    }
}