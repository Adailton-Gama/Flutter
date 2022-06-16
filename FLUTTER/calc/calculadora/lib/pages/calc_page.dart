import 'package:flutter/material.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({Key? key}) : super(key: key);

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  String conta = '';
  String res = '';
  String historico = '';
  int zeroDivisor = 1;
  bool get isZero => zeroDivisor == 0;
  String darkMode = '';
  bool get ondarkMode => darkMode =='Dark';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ondarkMode ? Colors.black : Color.fromRGBO(210, 232, 247, 1),
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: ondarkMode ? Colors.grey[100] : Color.fromRGBO(173, 214, 244, 1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: const Radius.circular(40),
                              bottomRight: const Radius.circular(40),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          margin: EdgeInsets.only(bottom: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Botões para controlar o light mode
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    //margin: EdgeInsets.symmetric(vertical: 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              darkMode ='Dark';
                                            });
                                          },
                                          child: Icon(
                                            Icons.dark_mode,
                                            size: 20,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Color.fromARGB(255, 5, 5, 5),
                                            onPrimary: Colors.grey[300],
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(0),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              darkMode='light';
                                            });
                                          },
                                          child: Icon(
                                            Icons.light_mode,
                                            color: Color.fromARGB(
                                                255, 254, 156, 76),
                                            size: 20,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            onPrimary: Color.fromARGB(
                                                255, 254, 156, 76),
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //Row onde estará o resultado e o calculo
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text(
                                      historico,
                                      style: TextStyle(
                                        color: ondarkMode ? Color.fromRGBO(72, 163, 241, 1) : Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text(
                                      conta,
                                      style: TextStyle(
                                        color: ondarkMode
                                              ? Color.fromRGBO(72, 163, 241, 1) 
                                              : Colors.black,
                                          fontSize:20,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text(
                                      isZero ? 'Impossivel dividir por 0' : res,
                                      style: TextStyle(
                                        color: ondarkMode
                                            ? Color.fromRGBO(72, 163, 241, 1)
                                            : isZero
                                            ? Colors.red[400]
                                            :  Color.fromRGBO(72, 163, 241, 1),
                                        fontSize: isZero ? 30 : 60,
                                        fontWeight: isZero
                                            ? FontWeight.w500
                                            :  FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              // 1 até 3 a operação +
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                         backgroundColor: ondarkMode ?  MaterialStateProperty.all<Color>(
                            Colors.grey) :  MaterialStateProperty.all<Color>(
                            Color.fromRGBO(72, 163, 241, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          conta = conta + '1';
                        });
                      },
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: ondarkMode
                              ? MaterialStateProperty.all<Color>(Colors.grey)
                              : MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(72, 163, 241, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                      onPressed: () {
                        setState(() {
                          conta = conta + '2';
                        });
                      },
                      child: const Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: ondarkMode
                              ? MaterialStateProperty.all<Color>(Colors.grey)
                              : MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(72, 163, 241, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        setState(() {
                          conta = conta + '3';
                        });
                      },
                      child: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: ondarkMode
                              ? MaterialStateProperty.all<Color>(Color.fromRGBO(72, 163, 241, 1))
                              : MaterialStateProperty.all<Color>(
                              Color.fromRGBO(241, 166, 51, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                      onPressed: () {
                        setState(() {
                          conta = conta + '+';
                        });
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // 4 até 6 a operação -
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: ondarkMode
                              ? MaterialStateProperty.all<Color>(Colors.grey)
                              : MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(72, 163, 241, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        setState(() {
                          conta += '4';
                        });
                      },
                      child: const Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: ondarkMode
                              ? MaterialStateProperty.all<Color>(Colors.grey)
                              : MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(72, 163, 241, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        setState(() {
                          conta += '5';
                        });
                      },
                      child: const Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: ondarkMode
                              ? MaterialStateProperty.all<Color>(Colors.grey)
                              : MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(72, 163, 241, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        setState(() {
                          conta += '6';
                        });
                      },
                      child: const Text(
                        '6',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: ondarkMode
                              ? MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(72, 163, 241, 1)) :
                          MaterialStateProperty.all<Color>(
                              Color.fromRGBO(241, 166, 51, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        setState(() {
                          conta += '-';
                        });
                      },
                      child: const Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // 7 até 9 a operação x
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: ondarkMode
                              ? MaterialStateProperty.all<Color>(Colors.grey)
                              : MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(72, 163, 241, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        setState(() {
                          conta += '7';
                        });
                      },
                      child: const Text(
                        '7',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: ondarkMode
                            ? MaterialStateProperty.all<Color>(Colors.grey)
                            : MaterialStateProperty.all<Color>(
                                Color.fromRGBO(72, 163, 241, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                      ),
                      onPressed: () {
                        setState(() {
                          conta += '8';
                        });
                      },
                      child: const Text(
                        '8',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: ondarkMode
                              ? MaterialStateProperty.all<Color>(Colors.grey)
                              : MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(72, 163, 241, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        setState(() {
                          conta += '9';
                        });
                      },
                      child: const Text(
                        '9',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: ondarkMode
                              ? MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(72, 163, 241, 1)) : MaterialStateProperty.all<Color>(
                              Color.fromRGBO(241, 166, 51, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        setState(() {
                          conta += 'x';
                        });
                      },
                      child: const Text(
                        'X',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // 0 .  = até a operação /
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: ondarkMode
                            ? MaterialStateProperty.all<Color>(Colors.grey)
                            : MaterialStateProperty.all<Color>(
                                Color.fromRGBO(72, 163, 241, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                      ),
                      onPressed: () {
                        setState(() {
                          conta += '0';
                        });
                      },
                      child: const Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: ondarkMode
                            ? MaterialStateProperty.all<Color>(Colors.grey)
                            : MaterialStateProperty.all<Color>(
                                Color.fromRGBO(72, 163, 241, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                      ),
                      onPressed: () {
                        setState(() {
                          conta += '.';
                        });
                      },
                      child: const Text(
                        '.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: ondarkMode
                            ? MaterialStateProperty.all<Color>(
                                Colors.orange):
                        MaterialStateProperty.all<Color>(
                            Color.fromRGBO(37, 202, 83, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                      ),
                      onPressed: () {
                        setState(() {
                          try{
                            if (conta.contains('+')) {
                              zeroDivisor = 1;
                            int operadorPos = conta.indexOf('+');
                            int fim = conta.length;
                            double val1 =
                                double.parse(conta.substring(0, operadorPos));
                            double val2 = double.parse(
                                conta.substring(operadorPos + 1, fim));
                            var valconta = val1 + val2;
                            res = valconta.toString();
                            historico += ', '+conta;
                            conta = '';

                          } else if (conta.contains('-')) {
                            zeroDivisor = 1;
                            int operadorPos = conta.indexOf('-');
                            int fim = conta.length;
                            double val1 =
                                double.parse(conta.substring(0, operadorPos));
                            double val2 = double.parse(
                                conta.substring(operadorPos + 1, fim));
                            var valconta = val1 - val2;
                            res = valconta.toString();
                            historico += ', '+conta;
                            conta = '';

                          } else if (conta.contains('÷')) {
                            int operadorPos = conta.indexOf('÷');
                            int fim = conta.length;
                            double val1 =
                                double.parse(conta.substring(0, operadorPos));
                            double val2 = double.parse(
                                conta.substring(operadorPos + 1, fim));
                            if(val2!=0){
                              zeroDivisor = 1;
                            var valconta = val1 / val2;
                            res = valconta.toString();
                            historico += ', '+conta;
                            conta = '';
                            }else{
                              //res='Impossivel dividir por 0';
                              zeroDivisor =0;
                              conta='';
                            }
                          } else if (conta.contains('x')) {
                            zeroDivisor = 1;
                            int operadorPos = conta.indexOf('x');
                            int fim = conta.length;
                            double val1 =
                                double.parse(conta.substring(0, operadorPos));
                            double val2 = double.parse(
                                conta.substring(operadorPos + 1, fim));
                            double valconta = val1 * val2;
                            res = valconta.toString();
                            historico += ', '+conta;
                            conta = '';

                          } 
                          }catch(e){
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Atenção!',style: TextStyle(color: Colors.red),),
                                content: Text('Esta operação é impossível de ser calculada, tente novamente!'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        res = '';
                                        historico	='';
                                        conta='';
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Text('Voltar'),
                                  ),
                                ],
                              ),
                            );
                          }
                          
                        },
                        );
                      },
                      child: const Text(
                        '=',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: ondarkMode
                            ? MaterialStateProperty.all<Color>(
                                Color.fromRGBO(72, 163, 241, 1)) :
                        MaterialStateProperty.all<Color>(
                            Color.fromRGBO(241, 166, 51, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                      ),
                      onPressed: () {
                        setState(() {
                          conta+='÷';
                        });
                      },
                      child: const Text(
                        '÷',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.49,
                    height: 60,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: ondarkMode
                            ? MaterialStateProperty.all<Color>(
                                Colors.orange)
                            : MaterialStateProperty.all<Color>(
                                Color.fromRGBO(157,156,172, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        setState(() {
                          conta = '';
                          res='';
                          historico='';
                        });
                      },
                      child: const Text(
                        'AC',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.49,
                    height: 60,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: ondarkMode
                            ? MaterialStateProperty.all<Color>(Color.fromRGBO(72, 162, 241, 1))
                            : MaterialStateProperty.all<Color>(Color.fromRGBO(241, 166, 51, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        setState(() {
                          zeroDivisor=1;
                          int del;
                          del = conta.length;
                          try{conta = conta.substring(0,del-1);}catch(e){
                            print(e);
                          }
                          print(conta);
                        });
                      },
                      child: const Icon(
                        Icons.backspace,                      
                          color: Colors.white,
                          size: 30,                        
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
