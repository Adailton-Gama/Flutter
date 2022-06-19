import 'dart:io';
import 'package:financas/pages/mainMenu.dart';
import 'package:financas/pages/newUser.dart';
import 'package:flutter/services.dart';
import'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
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
                decoration: BoxDecoration(color: Color.fromRGBO(38, 38, 38, 1),
                borderRadius: BorderRadius.circular(19),                
                ),
                child: Image.asset('assets/app/logo.png'),),
              Flexible(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children:[Container(                    
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(38, 38, 38, 1),
                        borderRadius: BorderRadius.circular(20)),             
                    
                    width: MediaQuery.of(context).size.width*0.90,
                    height: MediaQuery.of(context).size.height*0.6, 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Image.asset('assets/app/icon-man.png',width: 38.9,height: 44,),
                          SizedBox(width: 5),
                          const Text('CONTROLE FINANCEIRO ACADEMIA\n SUPER TREINO', 
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
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              labelText: 'E-mail',
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.white, style: BorderStyle.solid)),                  
                              focusedBorder:  UnderlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.white, style: BorderStyle.solid)),
                              labelStyle:TextStyle(color: Colors.white,fontFamily: 'Arial',fontWeight: FontWeight.bold),
                              ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom:10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              labelText: 'Senha',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.white,
                                      style: BorderStyle.solid)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.white,
                                      style: BorderStyle.solid)),
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainMenu()));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(61, 61, 61, 1)),
                                ),
                              child: Text('ENTRAR')),
                            SizedBox(width: 5,),
                            ElevatedButton(                              
                              onPressed: () {
                                showDialog(                                  
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Color.fromRGBO(38, 38, 38, 1),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Deseja Realmente Fechar?',style: TextStyle(color: Colors.white),),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(61, 61, 61, 1))),
                                                onPressed: () {
                                                  dispose();
                                                },
                                                child: Text('Sim')),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(61, 61, 61, 1))),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Não'))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Color.fromRGBO(61, 61, 61, 1)),
                              ),
                              child: Text('SAIR')),                                              
                          ],),
                          SizedBox(height: 5,),
                          Text('Caso você não possua uma conta clique\n no botão abaixo.',
                          style: TextStyle(
                            color: Colors.white, fontFamily: 'Arial',fontWeight: FontWeight.w100,fontSize: 10),
                            textAlign: TextAlign.center,
                            ),
                            SizedBox(
                          height: 5,
                        ),
                          ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(61, 61, 61, 1))),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => NewUser())));
                            }, 
                            child: Text('CADASTRAR')),
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
   @override
  void dispose(){
    if(Platform.isAndroid){
      SystemNavigator.pop();
    }else{
      exit(0);
    }
   }
}