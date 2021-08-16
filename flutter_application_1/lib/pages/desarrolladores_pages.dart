import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DesarrolladoresPage extends StatefulWidget {
  DesarrolladoresPage({Key? key}) : super(key: key);

  @override
  _DesarrolladoresPageState createState() => _DesarrolladoresPageState();
}

class _DesarrolladoresPageState extends State<DesarrolladoresPage> {
  
  Elementos el = new Elementos();

  

  
  List lst = [] ;

  String yaelLink = 'https://firebasestorage.googleapis.com/v0/b/integradora-a8d7e.appspot.com/o/Yael.jpg?alt=media&token=4a74fe3a-56ba-4ae7-927b-b5545fc5efee';
  String arturoLink = 'https://firebasestorage.googleapis.com/v0/b/integradora-a8d7e.appspot.com/o/Arturo.jpeg?alt=media&token=f03c0467-4b3b-4bae-9bb6-9882868323c4';
  String kevinLink = 'https://firebasestorage.googleapis.com/v0/b/integradora-a8d7e.appspot.com/o/Kevin.jpeg?alt=media&token=a34df2f8-15a6-4291-adf6-a067d4994a37';
  String erickLink = 'https://firebasestorage.googleapis.com/v0/b/integradora-a8d7e.appspot.com/o/rangel.jpeg?alt=media&token=4010d434-e55c-4d7b-a801-1270b396c397';
  @override
  void initState() {
    super.initState();
    readData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Desarrolladores',
        ),
        centerTitle: true,
        
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: el._personas(lst[0],erickLink),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: el._personas(lst[1] ,yaelLink),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: el._personas(lst[2] ,arturoLink),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: el._personas(lst[3] ,kevinLink),
          ),
        ],
      )
    );
  } 
  Future<void> readData() async{
    var url = Uri.parse("https://integradora-a8d7e-default-rtdb.firebaseio.com/Desarrolladores.json");
    final response = await http.get(url);
    final data = json.decode(response.body) as Map<String, dynamic>;
    data.forEach((key, value) {
      List<String>? ls = [];
      ls.add(value['nombre'].toString());
      ls.add(value['apellidos'].toString());
      ls.add(value['matricula'].toString());
      ls.add(value['rol'].toString());
      lst.add(ls);
    });
  }
}
class Elementos{
  Color _colorContainer = Colors.green;
  Color _colorText = Colors.white;

  Container _personas(List lst, String link,){
    String? variable1;
    String? variable2;
    String? variable3;
    String? variable4;
    
    variable1 = lst[0];
    variable2 = lst[1];
    variable3 = lst[2];
    variable4 = lst[3];
    
    return Container(
      child: Column(
        children: [
          Image.network(
            link,
            width: 100.0,
          ),
          SizedBox(height: 10.0,),
          Text(
            variable1 ?? '',
            style: TextStyle(
              color: _colorText,
              fontSize: 24.0,
            ),
          ),
          Text(
            variable2 ?? '',
            style: TextStyle(
              color: _colorText,
              fontSize: 20.0,
            ),
          ),
          Text(
            variable3 ?? '',
            style: TextStyle(
              color: _colorText,
              fontSize: 20.0,
            ),
          ),
          Text(
            variable4 ?? '',
            style: TextStyle(
              color: _colorText,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: _colorContainer,
        border: Border.all(
          color: Colors.black26, 
          width: 4
        ),
        borderRadius: BorderRadius.circular(20.0)
      ),
    ); 
  }
}