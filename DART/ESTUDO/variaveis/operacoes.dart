void maind(){
  double n1 = 5;
  double n2 = 2;
  int n3 = 4;

  double r1 = n3 *(n1 + n2 - 10) *10;
  print(r1);

  //Notação simplificada
  n1 +=10;
  n1 -=10;
  n1 /=10;
  n1 *=10;
  print(n1);

  //Incremento e decremento
  n3++;
  n3--;
  print(n3);

  //Resto da divisão
  int r2 = n3 % 5;
  print(r2);
}