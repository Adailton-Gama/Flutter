import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rastreamento_correios/resPage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController codigo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            children: [
              TextField(
                controller: codigo,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {
                    var codigoRastreio = codigo.text;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ResPage(codigoRastreio: codigoRastreio)));
                  },
                  child: Text(
                    'Pesquisar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
