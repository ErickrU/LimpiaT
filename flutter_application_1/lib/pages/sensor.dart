import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SensorPage extends StatefulWidget {
  SensorPage({Key? key}) : super(key: key);

  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _button(),
      ),
    );
  }
  Widget _button(){
    
    return IconButton(
      onPressed: (){
        setState(() {
          selected = !selected;
          if(selected == true){
            publish(1);
          }else{
            publish(0);
          }
        });
      }, 
      icon: Icon(selected ? Icons.lightbulb : Icons.lightbulb ),
      color: (selected ? Colors.yellow: Colors.grey),
      iconSize: 100,
    );
  }
  void publish(int variable) async{
    var url = Uri.parse("https://integradora-a8d7e-default-rtdb.firebaseio.com/Sensor.json");
    Map data = {'Status': variable};
    final response = await http.put(url, body: json.encode(data),  );	
  }
}