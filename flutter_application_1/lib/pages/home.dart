import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class appHome extends StatefulWidget {
  final String emailSend;
  appHome(this.emailSend, {Key? key}) : super(key: key);

  @override
  _appHomeState createState() => _appHomeState();
}

class _appHomeState extends State<appHome> {
  void initState() {
    super.initState();
    readData();
  }

  List<Map<String, dynamic>> list = [];

  bool show = false;

  var printCol;
  var printCamion;
  var printCalle;
  var printNotas;

  var printemail;

  List<Map<String, dynamic>> alldata = [];

  int colPicker = 0;

  bool reading = true;

  Future<void> readData() async {
    try {
      var url = Uri.parse(
          "https://integradora-a8d7e-default-rtdb.firebaseio.com/camiones_rutas.json");
      var response = await http.get(url);
      var data = json.decode(response.body) as Map<String, dynamic>;
      alldata.clear();
      list.clear();
      data.forEach((key, value) {
        alldata.add({
          "colonias": value['colonias'],
          "camion": value['camion'],
          "calles": value['calles'],
          'notas': value['notas']
        });
        list.add({"colonias": value['colonias']});
      });
      setState(() {
        reading = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void _postData() async {
    try {
      var url = Uri.parse(
          "https://integradora-a8d7e-default-rtdb.firebaseio.com/Usuarios/user_2.json");

      Map data = {'camion': printCamion, "email": printemail, "rol": "user_comun"};
      
      final response = await http.put(url, body: json.encode(data));

      if (response.statusCode == 200) {

      } else {

      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    printemail = widget.emailSend;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Limpia-T',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          children: [
            Text(
              'Hola bienvenido a Limpia-T',
              style: TextStyle(
                height: 1,
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '\n\nPorfavor seleccione su colonia o la mas cercana',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.home),
                filled: false,
                fillColor: Colors.white,
                errorStyle: TextStyle(color: Colors.yellow),
              ),
              value: null,
              items: list.map((map) {
                return DropdownMenuItem<String>(
                    child: Text(map["colonias"][0]), value: map["colonias"][0]);
              }).toList(),
              onChanged: (value) {
                setState(() {
                  Text('');
                  value = value;
                  for (int i = 0; i < list.length; i++) {
                    if (list[colPicker]['colonias'][0] == value) {
                      printCol = alldata[colPicker]['colonias'];
                      printCamion = alldata[colPicker]['camion'];
                      printCalle = alldata[colPicker]['calles'];
                      printNotas = alldata[colPicker]['notas'];
                      colPicker = 0;
                      show = true;
                    } else {
                      colPicker += 1;
                    }
                  }
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              child: Text(
                'Colonias: ${printCol.toString().replaceAll('[', '').replaceAll(']', '')}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              visible: show,
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              child: Text(
                'Camion recolector: ${printCamion.toString().replaceAll('[', '').replaceAll(']', '')}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              visible: show,
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              child: Text(
                'Calles: ${printCalle.toString().replaceAll('[', '').replaceAll(']', '')}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              visible: show,
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              child: Text(
                'Notas: ${printNotas.toString().replaceAll('[', '').replaceAll(']', '')}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              visible: show,
            ),
            SizedBox(
              height: 80,
            ),
            Visibility(
              child: Text(
                'El primer boton de lado derecho es para realizar un reporte queja o sugerencia, el segundo boton es para guardar la colonia que selecciono y que sea notificado',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
              ),
              visible: show,
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                  ),
                  FloatingActionButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, 'reports')},
                      tooltip: 'Reportes',
                      child: Icon(Icons.notes)),
                  SizedBox(
                    height: 5.0,
                  ),
                  FloatingActionButton(
                      onPressed: () => {_postData()},
                      tooltip: 'Guardar',
                      child: Icon(Icons.save)),
                  SizedBox(
                    height: 5.0,
                  ),
                  FloatingActionButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, 'about');
                      },
                      tooltip: 'About Us',
                      child: Icon(Icons.perm_identity)),
                ],
              ),
              visible: show,
            ),
          ]),
    );
  }
}
