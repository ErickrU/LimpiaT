import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class reportFormPage extends StatefulWidget {
  @override
  _reportFormPageState createState() => _reportFormPageState();
}

class _reportFormPageState extends State<reportFormPage> {
  final _reportController = TextEditingController();
  late String report;

  @override
  void dispose() {
    _reportController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reportar'),
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                'Reportar fallo o sugerencia',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: TextField(
                controller: _reportController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ingresa tu comentario'),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(onPressed: _repData, child: Text('Enviar'))
          ],
        ));
  }

  void _alert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('¡Enviado!'),
            content: Text('Gracias por tu comentario'),
          );
        });
  }

  void _repData() {
    setState(() {
      report = _reportController.text;

      _postData(
        report,
      );
    });
  }

  void _postData(String report) async {
    try {
      var url = Uri.parse(
          "https://integradora-a8d7e-default-rtdb.firebaseio.com/reportes.json");

      var data = {
        'reporte': report,
      };
      final response = await http.post(url, body: json.encode(data));
      if (response.statusCode == 200) {
        _alert();
      }       
        
    } catch (error) {
      print(error.toString());
    }
  }
}