//import 'dart:html';
import 'package:flutter/material.dart';

class appHome extends StatefulWidget {
  @override
  _appHomeState createState() => _appHomeState();
}


class _appHomeState extends State<appHome> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rutas')),
      body: Column(
        children: [
          Container(
            child: Text(
              '\nPor favor registre su reporte\n',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {},
              children: [
                new ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text('Reportes '),
                      );
                    },
                    body: ListTile(
                      title: Text('Sin servico de recoleccion'),
                      subtitle: Text('No se presento el camion'),
                    ),
                    isExpanded: true)
              ],
            ),
          ),
          Container(
            child: Text('\n'),
          ),
          Container(
            child: Text(
              'Fecha\n',
              textAlign: TextAlign.center,
            ),
          
          ),
          Container(
            child: Text(
              'Aqui aparecera la ruta de su camion ..............................',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Text(
              '\nActivar notificaiones\n',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  newMethod(value);
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ),
          Container(
            child: ButtonBar(
              children: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text('Guardar'),
                  color: Colors.green,
                  onPressed: (){
                  },
                )
              ],
            ),
          ),
           Container(
            child: ButtonBar(
              children: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text('Reportar'),
                  color: Colors.green,
                  onPressed: (){
                  },
                )
              ],
            ),
          ),
           Container(
            child: ButtonBar(
              children: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text('Admin'),
                  color: Colors.green,
                  onPressed: (){
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool newMethod(bool value) => isSwitched = value;
}
