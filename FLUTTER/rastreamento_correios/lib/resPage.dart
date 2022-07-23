import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rastreamento_correios/Objeto.dart';
import 'package:rastreamento_correios/searcPage.dart';

class ResPage extends StatelessWidget {
  final String codigoRastreio;
  const ResPage({Key? key, required this.codigoRastreio}) : super(key: key);

  Future<Map> getEncomenda() async {
    final url = Uri.parse(
        'https://proxyapp.correios.com.br/v1/sro-rastro/${codigoRastreio}');
    var response = await http.get(url);

    var data =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes))
          as Map<String, dynamic>;
    } else {
      throw Exception('Erro ao consultar encomenda');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          FutureBuilder<Map>(
            future: getEncomenda(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Erro ao consultar encomenda!'),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: Text('aa'),
                                  ));
                        },
                        child: ListTile(
                          title: Text(
                              snapshot.data![index]['objetos']['codObjeto']),
                        ),
                      );
                    });
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ]),
      ),
    );
  }
}
