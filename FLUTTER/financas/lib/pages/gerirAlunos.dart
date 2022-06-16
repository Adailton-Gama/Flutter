import 'package:financas/pages/mainMenu.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';


class GerirAlunos extends StatefulWidget {
  const GerirAlunos({Key? key}) : super(key: key);
  @override
  State<GerirAlunos> createState() => _GerirAlunosState();
}

class _GerirAlunosState extends State<GerirAlunos> {  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //AppBar
                Container(
                  height: 77,
                  width: MediaQuery.of(context).size.width * 1,
                  color: const Color.fromRGBO(61, 61, 61, 1),
                  child: Row(
                    children: [
                      Image.asset('assets/app/logo.png'),
                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        child: const Text(
                          'GESTÃO DE ALUNOS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.white,
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
        
                //Body:
                Container(
                  margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,               
                    children: [
                       const Text(
                        'ALUNOS\n CADASTRADOS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arial',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width*0.9,
                        height: MediaQuery.of(context).size.height*0.5,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Color.fromRGBO(61, 61, 61, 1),borderRadius: BorderRadius.circular(5)),
                        child: Flexible(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color.fromRGBO(61, 61, 61, 1)),
                                ),
                                onPressed: () => EditAluno(),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Horário: Manhã - Plano: Mensal',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
                                    ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('ADAILTON GAMA SANTANA',
                                          style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                                    ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('(74)99108-3075',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
                                    ),
                                        ],
                                      ),
                                    ],),
                                  ),
                              ),
                          ],)
                          ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                          Text('Total de Alunos: 15',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 10),
                          ),
                          Text('Valor Total Estimado: R\$ 600,00',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 10),
                          ),
                        ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [                            
                                ElevatedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).clearSnackBars();
                                        Future.delayed(Duration(milliseconds: 300))
                                            .then((value) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      const MainMenu())));
                                        });
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color.fromRGBO(61, 61, 61, 1)),
                                      ),
                                      child: Container(child: Row(children: [Icon(Icons.arrow_back),Text('VOLTAR')],),),
                                      ),
                                      SizedBox(width: 10),
                                      ElevatedButton(
                            onPressed: ()=>AddAluno(),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(61, 61, 61, 1)),
                            ),
                            child: Container(
                              width: 50,
                              height: 67,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/app/alunos.png',width: 34,height: 34,),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'ADD',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ],
                  ),
                      ),
              ]),
                ),
              ],
              ),
          ),
        ),
        ),
      );
  }

  void AddAluno(){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Color.fromRGBO(61, 61, 61, 1),
          content: Flexible(
            child: ListView(
              shrinkWrap: true,
              children:[ Container(
                color: Color.fromRGBO(61, 61, 61, 1),
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('DADOS DO ALUNO', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                      TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'ID: ',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(91, 91, 91, 1),
                                      width: 1)),
                            ),
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'NOME: ',
                               hintStyle: TextStyle(color:Colors.white),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(91, 91, 91, 1),width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(91, 91, 91, 1),
                                      width: 1)),
                            ),
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'PLANO: ',
                               hintStyle: TextStyle(color:Colors.white),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(91, 91, 91, 1),width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(91, 91, 91, 1),
                                      width: 1)),
                            ),
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'DIA DE PAGAMENTO: ',
                               hintStyle: TextStyle(color:Colors.white),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(91, 91, 91, 1),width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(91, 91, 91, 1),
                                      width: 1)),
                            ),
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'VALOR: ', 
                              hintStyle: TextStyle(color:Colors.white),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(91, 91, 91, 1),width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(91, 91, 91, 1),
                                      width: 1)),
                              ),
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'TELEFONE: ', 
                              hintStyle: TextStyle(color:Colors.white),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(91, 91, 91, 1),width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(91, 91, 91, 1),
                                      width: 1)),
                              ),
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'OBSERVAÇÕES: ', 
                              hintStyle: TextStyle(
                                color:Colors.white),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(91, 91, 91, 1),width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(91, 91, 91, 1),
                                      width: 1)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).clearSnackBars();
                                  Future.delayed(Duration(milliseconds: 300))
                                      .then((value) {
                                    Navigator.pop(context);
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.black),
                                ),
                                child: Container(
                                  child: Row(
                                    children: [Text('CADASTRAR')],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).clearSnackBars();
                                  Future.delayed(Duration(milliseconds: 300))
                                      .then((value) {
                                    Navigator.pop(context);
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.black),
                                ),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text('VOLTAR')
                                    ],
                                  ),
                                ),
                              ),
                            ],)
                    ],
                  )),
              ],
            ),
          ),
        ));
  }
  void EditAluno() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Color.fromRGBO(61, 61, 61, 1),
              content: Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                        color: Color.fromRGBO(61, 61, 61, 1),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('DADOS DO ALUNO', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'ID: ',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'NOME: ',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'PLANO: ',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'DIA DE PAGAMENTO: ',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'VALOR: ',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'TELEFONE: ',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'OBSERVAÇÕES: ',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(91, 91, 91, 1),
                                        width: 1)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    Future.delayed(Duration(milliseconds: 300))
                                        .then((value) {
                                      Navigator.pop(context);
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                  ),
                                  child: Container(
                                    child: Row(
                                      children: [Text('EDITAR')],
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    Future.delayed(Duration(milliseconds: 300))
                                        .then((value) {
                                      Navigator.pop(context);
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                  ),
                                  child: Container(
                                    child: Row(
                                      children: [Text('VOLTAR')],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ));
  }

}