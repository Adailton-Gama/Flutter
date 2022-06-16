void main(){
	saudacoes('Adailton');
	print('');
  saudacoesnull('Adailton', cliente: 'Vinicius');
}

void saudacoes(String nome, {
	bool mostrarAgora = true, 
	bool mostrarCliente = false, 
	String cliente = '',
	}){
	print('Saudações do $nome');
	
	if(mostrarCliente){
		print('Seja bem-vindo(a), $cliente!');
	}
	if(mostrarAgora){
		print('Agora: ${agora()}');
	}
	
}

String agora(){
	DateTime agora = DateTime.now();
	return agora.toString();
}

void saudacoesnull(String nome, {
	bool mostrarAgora = true,
	String? cliente,
	}){
	print('Saudações do $nome');
	if(cliente != null){
		print('Seja bem-vindo(a), $cliente!');
	}
	
	if(mostrarAgora){
		print('Agora: ${agora()}');
	}
	
}