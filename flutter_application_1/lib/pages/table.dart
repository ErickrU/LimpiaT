import 'package:flutter/material.dart';

class tablesPage extends StatefulWidget {
  tablesPage({Key? key}) : super(key: key);

  @override
  _tablesPageState createState() => _tablesPageState();
}

class _tablesPageState extends State<tablesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rutas", textAlign: TextAlign.center),
      ),
      body: _bodyapp(),
      floatingActionButton: _agregar(),
    );
  }
  Widget _agregar(){
    return FloatingActionButton.extended(
      onPressed: (){
        
      },
      label: Text("agregar"),
      icon : Icon(Icons.add),
    );
  }
  Widget _bodyapp(){
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal:10),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: DataTable(
            columns: [
              DataColumn(label: Text('Colonia')),
              DataColumn(label: Text('Camión')),
              DataColumn(label: Text('Notas')),
              DataColumn(label: Text('Calles')),
              DataColumn(label: Text('CaVe')),
              DataColumn(label: Text('Editar')),
              DataColumn(label: Text('Eliminar'))
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text("Francisco I. Madero")),
                DataCell(Text("1951")),
                DataCell(Text("-")),
                DataCell(Text("20 de Noviembre")),
                DataCell(Switch(
                  value: true,
                  onChanged: (bool state){
                    print(state);
                  },
                )),
                DataCell(Icon(Icons.mode_edit)),
                DataCell(Icon(Icons.delete))
              ])
            ],
          ),
        )
      ],
    );
  }
}