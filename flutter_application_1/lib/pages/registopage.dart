import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({Key? key}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  
  Color Color1 = Colors.green[800]!;
  Color Color2 = Colors.green[600]!;
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();
  
  late String email;
  late String password;
  late String password2;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _formSigupUI(),
    );
  }
Widget _formSigupUI(){
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
                  vertical: 50.0, horizontal: 24.0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Registrarse",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
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
                  padding: const EdgeInsets.all(24.0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          hintText: "E-mail",
                          prefixIcon:Icon(
                            Icons.email,
                            color: Colors.grey[600],
                          ) 
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          hintText: "Contraseña",
                          prefixIcon:Icon(
                            Icons.lock,
                            color: Colors.grey[600],
                          ) 
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: _password2Controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          hintText: "Confirmar Contraseña",
                          prefixIcon:Icon(
                            Icons.lock,
                            color: Colors.grey[600],
                          ) 
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _getData,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              "Registrarse",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0
                              ),
                            ),
                          ),
                        ),
                      ),
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
  void _getData() {
    setState(() {
      email = _emailController.text;
      password = _passwordController.text;
      password2 = _password2Controller.text;
      if(password == password2){
        _postData(password, email);
      }else{
        Fluttertoast.showToast(msg: 'Contraseña no coinciden',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
      }
      
    });
  }
  void _postData(String password, String email) async {
    try {
      var urll = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAo06keNrKP2qel3WyoIsWk_iO0L_j4eIc");
      var dato = {
        'email': email,
        'password': password
      };
      final respon = await http.post(urll, body: json.encode(dato));
      Map result = json.decode(respon.body);
      print(result);
      if(result['email'].toString() == email){
        var url = Uri.parse("https://integradora-a8d7e-default-rtdb.firebaseio.com/Usuarios.json");
        var data = {
          'email': email,
          'rol': 'user_comun',
        };
        final response = await http.post(url, body: json.encode(data));
        if (response.statusCode == 200) {
          Fluttertoast.showToast(msg: 'Ya quedo registrado',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
          Navigator.popAndPushNamed(context, 'login');
        }
      }
      if(result['error']['message'] == "EMAIL_EXISTS"){
        Fluttertoast.showToast(msg: 'Email Ya Existente',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
      }
    } catch (error) {
      print(error.toString());
    }
  }
}