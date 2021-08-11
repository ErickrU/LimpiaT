import 'package:flutter/material.dart';

//https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iniciar sesion", textAlign: TextAlign.center),
      ),
      body: _bodylogin(),
    );
  }
  Widget _bodylogin(){
    return ListView(
      scrollDirection: Axis.vertical,
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
            margin: EdgeInsets.all(20.0),
            
            
          ),
           
           Center(
             child: TextField(
               
               decoration: InputDecoration(
                 contentPadding: EdgeInsets.symmetric(horizontal:100, vertical:10),
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

            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            color: Colors.black,
            textColor: Colors.white,
            child: Text("Iniciar"),
          ),
      ],
    );
  }
}