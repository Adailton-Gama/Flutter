import 'dart:math';
import 'package:financas/pages/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vibration/vibration.dart';
import '../models/alunos.dart';
import '../repository/repository.dart';
import '../widgets/diaria.dart';

class DiariasPage extends StatefulWidget {
  const DiariasPage({Key? key}) : super(key: key);

  @override
  State<DiariasPage> createState() => _DiariasPageState();
}

class _DiariasPageState extends State<DiariasPage> {
  final DiariasRepository diariasRepository = DiariasRepository();
  final MaskTextInputFormatter datemask =
      MaskTextInputFormatter(mask: "##/##/####");
  final MaskTextInputFormatter telmask =
      MaskTextInputFormatter(mask: '(##) #####-####');
  List<Diarias> diarias = [];
  var count;
  int pagamento = 0;
  int recebido = 0;
  @override
  void initState() {
    super.initState();
    diariasRepository.getDiarias().then((value) {
      setState(() {
        diarias = value;
        count = diarias.length;
        for (var diaria in diarias) {
          pagamento += int.parse(diaria.valor);
          if (diaria.pago == true) {
            recebido += int.parse(diaria.valor);
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
                        'DIÁRIAS',
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
                        'CONTROLE DE \n PAGAMENTOS',
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
                            //para cada diária
                            for (Diarias diaria in diarias)
                              ItemDiaria(
                                  diaria: diaria,
                                  editDiaria: editDiaria,
                                  onDelete: onDelete),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Valor Total: R\$ $pagamento',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Valor Total Recebido: R\$ $recebido',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
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
                              child: Container(
                                child: Row(
                                  children: const [
                                    Icon(Icons.arrow_back),
                                    Text('VOLTAR')
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => addDiaria(),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(61, 61, 61, 1)),
                              ),
                              child: SizedBox(
                                width: 50,
                                height: 67,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/app/diarias.png',
                                      width: 34,
                                      height: 34,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'ADD',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
    );
  }

  void editDiaria(Diarias diaria) {
    final TextEditingController id = TextEditingController();
    final TextEditingController nome = TextEditingController();
    final TextEditingController dPagamento = TextEditingController();
    final TextEditingController valor = TextEditingController();
    final TextEditingController obs = TextEditingController();
    setState(() {
      id.text = diaria.id.toString();
      nome.text = diaria.nome;
      dPagamento.text = diaria.dPagamento;
      valor.text = diaria.valor.toString();
      obs.text = diaria.observacoes;
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
                            controller: dPagamento,
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
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (diaria.pago == true) {
                                  diaria.pago = false;
                                  recebido -= int.parse(diaria.valor);
                                  diariasRepository.saveDiariaList(diarias);
                                } else {
                                  diaria.pago = true;
                                  recebido += int.parse(diaria.valor);
                                  diariasRepository.saveDiariaList(diarias);
                                }
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: diaria.pago
                                  ? MaterialStateProperty.all<Color>(
                                      Colors.green)
                                  : MaterialStateProperty.all<Color>(
                                      Colors.red),
                            ),
                            child: Container(
                              child: Row(
                                children: [
                                  Text(diaria.pago ? 'PAGO' : 'PENDENTE')
                                ],
                              ),
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
                                  diaria.nome = nome.text;
                                  diaria.dPagamento = dPagamento.text;
                                  pagamento -= int.parse(diaria.valor);
                                  diaria.valor = valor.text;
                                  diaria.observacoes = obs.text;
                                  pagamento += int.parse(diaria.valor);
                                  diariasRepository.saveDiariaList(diarias);
                                  recebido = 0;
                                  for (Diarias diaria in diarias) {
                                    if (diaria.pago == true) {
                                      recebido += int.parse(diaria.valor);
                                    }
                                  }
                                });
                                ScaffoldMessenger.of(context).clearSnackBars();
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
    });
  }

  void addDiaria() {
    var rdnid = new Random().nextInt(1000);
    final TextEditingController id = TextEditingController();
    final TextEditingController nome = TextEditingController();
    final TextEditingController dPagamento = TextEditingController();
    final TextEditingController valor = TextEditingController();
    final TextEditingController obs = TextEditingController();
    setState(() {
      id.text = rdnid.toString();
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Color.fromRGBO(61, 61, 61, 1),
                content: Container(
                    color: Color.fromRGBO(61, 61, 61, 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('CADASTRAR NOVA DIÁRIA',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 15,
                        ),
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
                            controller: dPagamento,
                            inputFormatters: [
                              datemask,
                            ],
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
                                  if (nome.text == '' ||
                                      dPagamento.text == '' ||
                                      valor.text == '') {
                                    Vibration.vibrate();
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                        'Favor preencher os dados dos alunos!',
                                        textAlign: TextAlign.center,
                                      ),
                                      duration: Duration(seconds: 3),
                                      backgroundColor:
                                          Color.fromRGBO(30, 30, 30, 1),
                                    ));
                                  } else {
                                    Diarias newDiaria = Diarias(
                                      id: int.parse(id.text),
                                      nome: nome.text,
                                      dPagamento: dPagamento.text,
                                      valor: valor.text,
                                      pago: true,
                                      observacoes: obs.text,
                                    );
                                    diarias.add(newDiaria);
                                    count = diarias.length;
                                    pagamento += int.parse(newDiaria.valor);
                                    print(diarias);
                                    diariasRepository.saveDiariaList(diarias);
                                    for (Diarias diaria in diarias) {
                                      if (diaria.pago == true) {
                                        recebido += int.parse(diaria.valor);
                                      }
                                    }
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                              child: Container(
                                child: Row(
                                  children: const [Text('ADICIONAR')],
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
    });
  }

  void onDelete(Diarias diaria) {
    Diarias offDelete = diaria;
    int offDeletePos = diarias.indexOf(diaria);
    print(diaria.nome);
    setState(() {
      diarias.remove(diaria);
      count = diarias.length;
      pagamento -= int.parse(diaria.valor);
      diariasRepository.saveDiariaList(diarias);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('O aluno(a): ${diaria.nome} foi removida com sucesso!',
            style: const TextStyle(color: Colors.white)),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              diarias.insert(offDeletePos, offDelete);
              pagamento += int.parse(offDelete.valor);
              count = diarias.length;
              diariasRepository.saveDiariaList(diarias);
            });
          },
        ),
        duration: Duration(seconds: 5),
      ),
    );
  }
}
