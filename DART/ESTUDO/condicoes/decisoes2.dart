void main(){
//Operador Ternario
double nota = 8;
String mensagem = nota >=5 ? 'Aprovado' : 'Reprovado';
int numero = nota == 5 ? 10 : 2;
print(mensagem);
print(numero);

//SwitchCase
String linguagem = 'Dart';
//Com if
if (linguagem == 'Dart'){
	print('Linguagem Dart com IF');
}else if(linguagem == 'C '){
	print('Linguagem C com IF');
}else if(linguagem =='Swift'){
	print('Linguagem Swift com IF');
}

//Tomada de decisão com Switch
switch(linguagem){
	case 'Dart':
		print('Linguagem Dart com Switch');
		break;
		
	case 'C':
		print('Linguagem C com Switch');
		break;
		
	case 'Swift':
		print('Linguagem Swift com Switch');
		break;
		
	default:
		print('Desconhecida');
}

int n = 5;

switch(n){
	case 10:
		print('10');
		break;
	case 20:
		print('20');
		break;
	default:
		print('não é nem 10 e nem 20');
}
}