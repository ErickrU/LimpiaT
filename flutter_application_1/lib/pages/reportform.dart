import 'package:flutter/material.dart';


class reportFormPage extends StatefulWidget {
  reportFormPage({Key? key}) : super(key: key);

  @override
  _reportFormPageState createState() => _reportFormPageState();
}

class _reportFormPageState extends State<reportFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reportes", textAlign: TextAlign.center),
      ),
      body: _bodyreportForm(),
    );
  }
  Widget _bodyreportForm(){
    return ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child: Text(
                '\n Por favor registre sus reportes \n',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                '\n Seleccione su fecha \n',
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
                          title: Text('Fecha'),
                        );
                      },
                      body: ListTile(
                        title: Text('24-07-2021'),
                        subtitle: Text('Viernes'),
                      ),
                      isExpanded: true)
                ],
              ),
            ),
            Container(
              child: Text(
                '\n Seleccione su colonia \n',
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
                          title: Text('Colonia'),
                        );
                      },
                      body: ListTile(
                        title: Text('Centro'),
                        subtitle: Text('Calle principal 21 de marzo'),
                      ),
                      isExpanded: true)
                ],
              ),
            ),
            Container(
              child: Text(
                '\n Seleccione su tipo de problema \n',
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
                          title: Text('Problema'),
                        );
                      },
                      body: ListTile(
                        title: Text('No se presento el camion'),
                        subtitle: Text('El servicio de recoleccion no se presento'),
                      ),
                      isExpanded: true)
                ],
              ),
            ),
            Container(
              child: Text(
                '\n Agregue una descripcion \n',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
  }
}