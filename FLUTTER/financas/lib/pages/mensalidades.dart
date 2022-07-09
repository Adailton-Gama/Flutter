import 'package:financas/pages/mainMenu.dart';
import 'package:financas/widgets/mensal.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../models/alunos.dart';
import '../repository/repository.dart';

class Mensalidades extends StatefulWidget {
  const Mensalidades({Key? key}) : super(key: key);

  @override
  State<Mensalidades> createState() => _MensalidadesState();
}

class _MensalidadesState extends State<Mensalidades> {
  final AlunoRepository alunoRepository = AlunoRepository();
  final MaskTextInputFormatter datemask =
      MaskTextInputFormatter(mask: '##/##/####');
  List<Alunos> alunos = [];
  var count = 0;
  int pagamento = 0;
  int recebido = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    alunoRepository.getAlunos().then((value) {
      alunos = value;
      count = alunos.length;
      setState(() {
        for (Alunos aluno in alunos) {
          pagamento += aluno.valor;
        }
        for (Alunos aluno in alunos) {
          if (aluno.pago == true) {
            recebido += aluno.valor;
          }
        }
      });
    });
  }

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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: const Text(
                          'MENSALIDADES',
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
                  margin:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'CONTROLE DE \n MENSALIDADES',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.5,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(38, 38, 38, 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Flexible(
                              child: ListView(
                            shrinkWrap: true,
                            children: [
                              //para cada mensalidade
                              for (Alunos aluno in alunos)
                                ItemMensalidade(
                                  alunos: aluno,
                                  editMensalidade: editMensalidade,
                                ),
                            ],
                          )),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total de Alunos: $count',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10),
                              ),
                              Text(
                                'Valor Total: R\$ $pagamento',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Valor Recebido: R\$ $recebido',
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
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
                                child: Container(
                                  child: Row(
                                    children: const [
                                      Icon(Icons.arrow_back),
                                      Text('VOLTAR')
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

  void editMensalidade(Alunos aluno) {
    final TextEditingController id = TextEditingController();
    final TextEditingController nome = TextEditingController();
    final TextEditingController plano = TextEditingController();
    final TextEditingController dPagamento = TextEditingController();
    final TextEditingController dqpago = TextEditingController();
    final TextEditingController valor = TextEditingController();
    final TextEditingController obs = TextEditingController();
    setState(() {
      id.text = aluno.id.toString();
      nome.text = aluno.nome;
      plano.text = aluno.plano;
      dPagamento.text = aluno.dPagamento;
      valor.text = aluno.valor.toString();
      dqpago.text = aluno.dqpago;
      obs.text = aluno.observacoes;
    });
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Color.fromRGBO(61, 61, 61, 1),
              content: Container(
                  color: Color.fromRGBO(61, 61, 61, 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('DADOS DO PAGAMENTO',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        height: 30,
                        child: TextField(
                          controller: id,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        height: 30,
                        child: TextField(
                          controller: nome,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        height: 30,
                        child: TextField(
                          controller: plano,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        height: 30,
                        child: TextField(
                          controller: dPagamento,
                          inputFormatters: [datemask],
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                            hintText: 'DATA DE VENCIMENTO: ',
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
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        height: 30,
                        child: TextField(
                          controller: valor,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        height: 30,
                        child: TextField(
                          controller: dqpago,
                          inputFormatters: [datemask],
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                            hintText: 'DATA DE PAGAMENTO: ',
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
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        margin: EdgeInsets.only(bottom: 20),
                        height: 30,
                        child: TextField(
                          controller: obs,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                int controle = 1;
                                if (controle == '') {
                                  print(1);
                                } else {
                                  aluno.nome = nome.text;
                                  aluno.plano = plano.text;
                                  aluno.dPagamento = dPagamento.text;
                                  aluno.valor = int.parse(valor.text);
                                  aluno.dqpago = dqpago.text;
                                  aluno.observacoes = obs.text;
                                  if (aluno.dqpago != '') {
                                    aluno.pago = true;
                                    recebido += aluno.valor;
                                  } else {
                                    aluno.pago = false;
                                    for (Alunos aluno in alunos) {
                                      if (aluno.pago == true) {
                                        recebido = 0;
                                        recebido += aluno.valor;
                                      }
                                    }
                                  }
                                  alunoRepository.saveAlunoList(alunos);
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  Future.delayed(Duration(milliseconds: 300))
                                      .then((value) {
                                    Navigator.pop(context);
                                  });
                                }
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                            child: Container(
                              child: Row(
                                children: const [Text('CONFIRMAR')],
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
                                children: const [Text('VOLTAR')],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ));
  }
}
