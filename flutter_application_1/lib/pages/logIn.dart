import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iniciar sesion',
      
      home: Scaffold(
        body: Column(
          children:[ 
            Container(
            width: 200,
            height: 200,
            color: Colors.black,
            child: Image.asset(
              'assets/inicio.jpg',
               fit: BoxFit.none,
               scale: 3,
              ),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(100.0),
            
            
          ),
           
           Center(
             child: TextField(
               
               decoration: InputDecoration(
                 contentPadding: EdgeInsets.symmetric(horizontal:100, vertical:15.0),
                 border: InputBorder.none,
                 hintText: 'ingresa correo',),
              ),
              
           ),
           Center(
             child: TextField(

               decoration: InputDecoration(
                 contentPadding: EdgeInsets.symmetric(horizontal:100, vertical:30.0),
                 border: InputBorder.none,
                 hintText: 'ingresa tu contraseña'),
                 
              ),
              
           ),
          FlatButton(
            
           padding: EdgeInsets.symmetric(horizontal:80, vertical:2.0),
            onPressed: (){ 
             child: (() {
             });
            },
            
            shape: RoundedRectangleBorder(
              
              borderRadius: BorderRadius.circular(30)
            ),
            color: Colors.black,
            
            textColor: Colors.white,
            child: Text("Iniciar"),
          ),
          
         ],
         
         )
      )
      
    );
    
  }
}

