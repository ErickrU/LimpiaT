import 'package:flutter/material.dart'; 
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; 

class formPage extends StatefulWidget {
  formPage({Key? key}) : super(key: key);

  @override
  _formPageState createState() => _formPageState();
}

class _formPageState extends State<formPage> {

  late String calles;
  late String colonia;
  late String camion;
  late String notas;

  final _callesController = TextEditingController();
  final _coliniaController = TextEditingController();
  final _camionController = TextEditingController();
  final _notasController = TextEditingController();

  void dispose(){
    _callesController.dispose();
    _coliniaController.dispose();
    _camionController.dispose();
    _notasController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _formularioStreetsUI(),
    );
  }
  Widget _formularioStreetsUI(){

    Color Color1 = Colors.green[800]!;
    Color Color2 = Colors.green[600]!;

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
              Color1,
              Color2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40.0, horizontal: 24.0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Formularios Rutas",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Text(
                        'Nota: separar los campos por "/"',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(  
                        controller: _coliniaController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.0),
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          fillColor: Colors.white,        
                          icon: const Icon(
                            Icons.map_outlined,
                            color: Colors.green,
                          ),
                          hintText: 'Coloque el nombre de la colonia',  
                          labelText: 'Colonia',
                          labelStyle: TextStyle(
                            color: Colors.green
                          )
                        ),  
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField( 
                        controller: _callesController, 
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              borderSide: BorderSide(
                                color: Colors.green,
                              ),
                          ),
                          fillColor: Colors.white,    
                          icon: const Icon(
                            Icons.maps_home_work_sharp,
                            color: Colors.green,
                          ),  
                          hintText: 'Coloque el nombre de las calles por las que pasara',  
                          labelText: 'Calles',
                          labelStyle: TextStyle(
                            color: Colors.green
                          )  
                        ),  
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField( 
                        controller:_notasController,
                        decoration:  InputDecoration( 
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.0),
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          fillColor: Colors.white,    
                          icon: const Icon(
                            Icons.calendar_today,
                            color: Colors.green,
                          ),  
                          hintText: 'Descripcion, nota o comentario',  
                          labelText: 'Nota',
                          labelStyle: TextStyle(
                            color: Colors.green
                          )  
                        ),  
                      ),
                      SizedBox(
                        height:50.0
                      ),
                      TextFormField(  
                        controller: _camionController,
                        keyboardType: TextInputType.number,
                        decoration:  InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.0),
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          fillColor: Colors.white,    
                          icon: const Icon(
                            Icons.directions_bus,
                            color: Colors.green,
                          ),  
                          hintText: 'Numero de camion',  
                          labelText: 'Camion',
                          labelStyle: TextStyle(
                            color: Colors.green
                          )  
                        ),  
                      ), 
                      SizedBox(
                        height:50.0
                      ),
                      Container(
                        padding: EdgeInsets.all(30.0),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _getData,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              "Guardar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0
                              ),
                            ),
                          ),
                        ),
                      )   
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _getData(){
    setState(() {
      colonia = _coliniaController.text;
      calles = _callesController.text;
      camion = _camionController.text;
      notas = _notasController.text;
      _postData(colonia,calles,camion,notas);
    });
  }
  void _postData(String colonia,String calles,String camion,String notas) async{
    try {
      var url = Uri.parse('https://integradora-a8d7e-default-rtdb.firebaseio.com/camiones_rutas.json');
      var data = {'colonia':strtolsit(colonia) , 'calles': strtolsit(calles), 'camion': camion, 'notas': notas};
      final response = await http.post(url,body: json.encode(data));
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Datos Guardados correctamente',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
        _coliniaController.clear();
        _callesController.clear();
        _camionController.clear();
        _notasController.clear();
      }
    }catch(e) {
      print("Error: $e");
      Fluttertoast.showToast(msg: 'Error',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
    }
  }
  List  strtolsit(String str){
    List ls = str.split('/');
    return ls;
  }
}
