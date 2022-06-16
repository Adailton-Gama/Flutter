void main(){
  RepositorioPessoas repo = RepositorioPessoasRemote();
  repo.ler(10);
  repo.adicionar('Adailton');
  repo.apagar(5);
}
abstract class RepositorioPessoas{
  String ler (int i);
  void adicionar(String nome);
  void apagar(int i);
}
class RepositorioPessoasRemote implements RepositorioPessoas{
  
  String ler(int i){
    return 'Adailton';  
  }
  void adicionar(String nome){

  }
  void apagar(int i){

  }
}

class RepositorioPessoasLocal  implements RepositorioPessoas {
 String ler(int i) {
    return 'Adailton';
  }

  void adicionar(String nome) {}
  void apagar(int i) {}
}
