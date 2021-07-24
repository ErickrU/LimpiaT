import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '¡Atencion!',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('¡Atención! ¡Atencción!'),

        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(500),
              boxShadow: [
                BoxShadow(color: Colors.black45,
                offset: Offset(6,6),
                blurRadius: 4,
                )
              ],
            ),
            child: Text('¡Atento el camion esta apunto de pasar por tu domicilio! ¡Atento el camion esta apunto de pasar por tu domicilio!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            ),
            
            padding: EdgeInsets.all(10),
            
            ),
          ),
        ),
      
    );
  }
}

