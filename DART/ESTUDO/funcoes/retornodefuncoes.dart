void main() {
 saudacoes('Adailton', true);
	print('');
	String a = agora();
	print(a);
  
  //Parametros opcionais não posicionados.
  // Com [] eles são posicionados, são opcinais, mas apenas aceitavel se for na ordem pré-definida.
  // Com {} eles são não posicionados, são opcinais, mas para usa-lo deve-se colocar qual o parametro e depois o valor do mesmo.
  saudacoesPo('Adailton Gana!!', sep: '~');

}

void saudacoes(String nome, bool mostrarAgora){
	print('Saudações do $nome');
	print('Seja bem-vindo(a)');
	if(mostrarAgora){
		print('Agora: ${agora()}');
	}
	
}

String agora(){
	DateTime agora = DateTime.now();
	return agora.toString();
}
void saudacoesPo(String nome, {bool mostrarAgora = true, String sep = '-'}){
	print(sep * 20);
	print('Saudações do $nome');
	print('Seja bem-vindo(a)');
	if(mostrarAgora){
		print('Agora: ${agora()}');
	}
	
}