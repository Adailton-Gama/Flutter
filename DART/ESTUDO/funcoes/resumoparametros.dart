void main(){
	saudacoes('Adailton', cliente: 'Vinicius');
  resumo('A','B',d: 'D',e:null);
	
}
String agora(){
	DateTime agora = DateTime.now();
	return agora.toString();
}

void saudacoes(String nome, {bool mostrarAgora = true, String? cliente}){
	print('Saudações do ${nome.toUpperCase()}');	
	
	//NULL-AWARE
	String c = cliente ?? 'Não informado';
	print('Seja bem-vindo(a), ${c.toUpperCase()}!');
	
	if(mostrarAgora){
		print('Agora: ${agora()}');
	}	
}

void resumo(String a, //Variavel posicional obrigatória
			String? b, //Variavel posicional obrigatória nula
			{
				String? c, //Variavel nula não obrigatória
				required String d, //Variavel obrigatória
				required String? e, //Variavel obrigatória nula
			}  //Variaveis nomeadas
			){

      print(a);
      print(b);
      print(c);
      print(d);
      print(e);
	
}