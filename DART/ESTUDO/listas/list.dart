void main(){
	List nomes = ['Adailton', 'Gama'];
	print(nomes[0]);

  
	List<int> idades = [15,10,2,20];
	print(idades.length);
	
	print(idades.first);
	print(idades.last);
	print(idades[2]);

  
  var pesqNome = 'Gama';
  var ver = nomes.contains(pesqNome); // Pesquisa pelo nome
  if (ver){
    var i = nomes.indexOf(pesqNome); //busca o indice do nome
    print(nomes);
    print('');
    nomes.removeAt(i); // remove pelo indice
    print(nomes);
  }
    
}