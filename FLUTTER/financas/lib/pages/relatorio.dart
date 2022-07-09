import 'package:financas/pages/mainMenu.dart';
import 'package:flutter/material.dart';

import '../models/alunos.dart';
import '../repository/repository.dart';

class RelatorioPage extends StatefulWidget {
  const RelatorioPage({Key? key}) : super(key: key);

  @override
  State<RelatorioPage> createState() => _RelatorioPageState();
}

class _RelatorioPageState extends State<RelatorioPage> {
  final AlunoRepository alunoRepository = AlunoRepository();
  final DiariasRepository diariasRepository = DiariasRepository();
  final DespesasRepository despesasRepository = DespesasRepository();
  List<Alunos> alunos = [];
  List<Diarias> diarias = [];
  List<Despesas> despesas = [];
  int mensalidade = 0;
  int vdiaria = 0;
  int vdespesa = 0;
  int liquido = 0;
  @override
  void initState() {
    super.initState();
    alunoRepository.getAlunos().then((value) {
      setState(() {
        alunos = value;
        for (var aluno in alunos) {
          if (aluno.pago == true) {
            mensalidade += aluno.valor;
          }
        }
      });
      diariasRepository.getDiarias().then((value) {
        setState(() {
          diarias = value;
          for (var diaria in diarias) {
            if (diaria.pago == true) {
              vdiaria += int.parse(diaria.valor);
            }
          }
        });

        despesasRepository.getDespesas().then((value) {
          setState(() {
            despesas = value;
            for (var despesa in despesas) {
              if (despesa.pago == true) {
                vdespesa += despesa.valor;
              }
            }
            liquido = mensalidade + vdiaria;
            liquido -= vdespesa;
            print(liquido);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                height: 124,
                width: 124,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(61, 61, 61, 1),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Image.asset('assets/app/logo.png'),
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(38, 38, 38, 1),
                          borderRadius: BorderRadius.circular(20)),
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/app/icon-man.png',
                                width: 38.9,
                                height: 44,
                              ),
                              SizedBox(width: 5),
                              const Text(
                                'CONTROLE FINANCEIRO ACADEMIA\n SUPER TREINO',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Arial',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          const Text(
                            'RELATÓRIO GERAL',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Arial',
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 140,
                                height: 110,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(61, 61, 61, 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Mensalidade',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'Arial',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'R\$ $mensalidade',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 140,
                                height: 110,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(61, 61, 61, 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Diárias',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'Arial',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'R\$ $vdiaria',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 140,
                                height: 110,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(61, 61, 61, 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Despesas',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'Arial',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'R\$ $vdespesa',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 140,
                                height: 110,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(61, 61, 61, 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Líquido',
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontFamily: 'Arial',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'R\$ $liquido',
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
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
                              SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
