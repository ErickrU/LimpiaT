import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class tablesPage extends StatefulWidget {
  tablesPage({Key? key}) : super(key: key);

  @override
  _tablesPageState createState() => _tablesPageState();
}

class _tablesPageState extends State<tablesPage> {
  bool selected = false;
  List<Map> list = [];
  bool reading = true;

  void initState(){
    super.initState();
    readData();
  }

  Future<void> readData() async{
    try{
      var url = Uri.parse("https://integradora-a8d7e-default-rtdb.firebaseio.com/camiones_rutas.json");
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
      list.clear();
      data.forEach((key, value) {//sacar las keys y valores de un mapa
        /*list.add(value['nombre']);
        list.add(value['email']);*/
        list.add({"colonias":formato(value['colonias']), "camion":value['camion'], "notas":value['notas'], "calles":formato(value['calles'])});
      });
      setState(() {
        reading = false;
      });
    }catch(e){
      print(e.toString());
    }
  }

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
              DataColumn(label: Text('Clave')),
              DataColumn(label: Text('Eliminar'))
            ],
            rows:
                list // Loops through dataColumnText, each iteration assigning the value to element
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(element["colonias"])), //Extracting from Map element the value
                              DataCell(Text(element["camion"])),
                              DataCell(Text(element["notas"])),
                              DataCell(Text(element["calles"])),
                              DataCell(IconButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, 'sensor');
                                }, 
                                icon: Icon(Icons.lightbulb),
                                color: (Colors.green),
                              )),
                              DataCell(Icon(Icons.delete,color: (Colors.green)))
                            ],
                          )),
                    )
                    .toList(),
          ),
        )
      ],
    );
  }
  String formato(var lst){
    String str = "";
    for (var i =0; i<= lst.length-1; i++){
      str += lst[i];
      str += "\n";
    }
    return str;
  }
}