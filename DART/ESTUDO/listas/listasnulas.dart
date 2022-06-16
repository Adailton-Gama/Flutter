void main(){
	
	List<String?> lista1 = [
	'Adailton',
	null,
	'Gama',
	null
	];
	
	lista1.add('Bruno');
		
	List<String>? lista2; // apenas a lista pode ser nula
	if(lista2 !=null){
	  lista2.add('Adailton');
  }
	
	List<String?>? lista3; // os itens podem ser nulos e a lista também
	
	List<String?> lista4 = [];
	
}