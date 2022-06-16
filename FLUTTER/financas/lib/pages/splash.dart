import 'package:financas/main.dart';
import 'package:financas/pages/loginPage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value){
    Navigator.push(
        context, new MaterialPageRoute(builder: ((context) => LoginPage())));

    });
  }
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 285,
                  width: 285,              
                  decoration:  BoxDecoration(color: Color.fromRGBO(61, 61, 61, 1),
                  borderRadius: BorderRadius.circular(20),
        
                  ),
                  child:Image.asset(
                  'assets/app/logo.png',
                  width: 255,
                  height: 230,
                ),
                ),
                Container(child: Image.asset('assets/app/icon-man.png',width: 87,height: 94,),),
               const Text('CONTROLE FINANCEIRO',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold),
            ),
                const Text('ACADEMIA',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold),
            ),
               const Text('SUPER TREINO',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold),
            ),

              ],
            ));
  }
}