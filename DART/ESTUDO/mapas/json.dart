import 'dart:convert';
void main(){
Map<String, dynamic> dados = json.decode(dadosdoUsuario());
  print(dados['nome']);
  print(dados['endereco']['rua']);
  print(dados['cursos'][1]);

}

String dadosdoUsuario() {
  return """
	{
		"nome": "Adailton",
		"sobrenome": "Gama",
		"idade": 23,
		"estadocivil": "casado",
		"cursos": ["Dart", "Flutter", "Python"],
		"endereco":{
			"rua":"Marechal Lott",
			"numero": 673,
			"bairro":"centro",
			"cidade":"cansanção"
		}
	}
	""";
}