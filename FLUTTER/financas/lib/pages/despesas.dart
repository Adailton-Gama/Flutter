import 'package:financas/pages/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DespesasPage extends StatefulWidget {
  const DespesasPage({Key? key}) : super(key: key);

  @override
  State<DespesasPage> createState() => _DespesasPageState();
}

class _DespesasPageState extends State<DespesasPage> {
  DateTime? _datetime;
  DateTime? _datepag;

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
                margin: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 0),
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
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.5,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(61, 61, 61, 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Flexible(
                            child: ListView(
                          shrinkWrap: true,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(61, 61, 61, 1)),
                              ),
                              onPressed: () => editAluno(),
                              child: Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Data de Vencimento: 22/06/2022',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'INTERNET',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'R\$ 40,00 - Status: Pendente',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Total de Alunos: 15',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10),
                            ),
                            Text(
                              'Valor Total: R\$ 600,00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Valor Pago: R\$ 560,00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                Future.delayed(
                                        const Duration(milliseconds: 300))
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
                                        const Color.fromRGBO(61, 61, 61, 1)),
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
    );
  }

  void editAluno() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: const Color.fromRGBO(61, 61, 61, 1),
              content: Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                        color: const Color.fromRGBO(61, 61, 61, 1),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('DADOS DO PAGAMENTO',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              height: 30,
                              child: const TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              height: 30,
                              child: const TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              height: 30,
                              child: const TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              height: 30,
                              width: 300,
                              child: FlatButton(
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color:
                                          const Color.fromRGBO(91, 91, 91, 1),
                                      width: 1,
                                      style: BorderStyle.solid),
                                ),
                                onPressed: () => dateVenc(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(_datetime == null
                                        ? 'Data de Vencimento:'
                                        : DateFormat('dd/MM/yyyy')
                                            .format(_datetime!)),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              height: 30,
                              width: 300,
                              child: FlatButton(
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color.fromRGBO(91, 91, 91, 1),
                                      width: 1,
                                      style: BorderStyle.solid),
                                ),
                                onPressed: () => datePag(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(_datepag == null
                                        ? 'Data de Pagamento:'
                                        : DateFormat('dd/MM/yyyy')
                                            .format(_datepag!)),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              height: 30,
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12, 0, 12, 0),
                                  hintText: 'STATUS: ',
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
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                                      children: const [Text('CONFIRMAR')],
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
                                      children: const [Text('VOLTAR')],
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

  void dateVenc() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((date) {
      setState(() {
        _datetime = date!;
      });
    });
  }

  void datePag() {
    setState(() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2050))
          .then((value) {
        _datepag = value!;
      });
    });
  }
}
