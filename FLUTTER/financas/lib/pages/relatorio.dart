import 'package:financas/pages/mainMenu.dart';
import 'package:flutter/material.dart';

class RelatorioPage extends StatefulWidget {
  const RelatorioPage({Key? key}) : super(key: key);

  @override
  State<RelatorioPage> createState() => _RelatorioPageState();
}

class _RelatorioPageState extends State<RelatorioPage> {
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
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(61, 61, 61, 1)),
                                ),
                                child: SizedBox(
                                  width: 110,
                                  height: 110,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Mensalidade',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Arial',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'R\$ 1.000,00',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(61, 61, 61, 1)),
                                ),
                                child: SizedBox(
                                  width: 110,
                                  height: 110,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Diárias',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Arial',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'R\$ 1.000,00',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(61, 61, 61, 1)),
                                ),
                                child: SizedBox(
                                  width: 110,
                                  height: 110,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Despesas',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Arial',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'R\$ 1.000,00',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(61, 61, 61, 1)),
                                ),
                                child: SizedBox(
                                  width: 110,
                                  height: 110,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Líquido',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Arial',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'R\$ 1.000,00',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
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
