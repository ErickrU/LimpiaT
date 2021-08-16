import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  Color Color1 = Colors.green[800]!;
  Color Color2 = Colors.green[600]!;

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  late String email;
  late String password;

  var emailSend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _formularioLoginUI(),
    );
  }

  Widget _formularioLoginUI() {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
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
                    vertical: 50.0, horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ingresar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Tulancingo te quiero limpio!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w300),
                    )
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
                      topRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color(0xFFe7edeb),
                            hintText: "E-mail",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey[600],
                            )),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: _passwordcontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color(0xFFe7edeb),
                            hintText: "Contraseña",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey[600],
                            )),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'forgotPass');
                            },
                            child: Text(
                              'Recuperar contraseña',
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _loginButton,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              "Iniciar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:50.0
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'registro');
                          },
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

  void _loginButton() {
    email = _emailcontroller.text;
    emailSend = _emailcontroller.text;
    password = _passwordcontroller.text;
    authUser(email, password);
  }

  void authUser(String email, String password) async {
    try {
      var url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAo06keNrKP2qel3WyoIsWk_iO0L_j4eIc');
      Map<String, dynamic> map = new Map<String, dynamic>();
      map['email'] = email;
      map['password'] = password;
      var response = await http.post(url, body: map);
      if (response.statusCode == 200) {
        var url = Uri.parse("https://integradora-a8d7e-default-rtdb.firebaseio.com/Usuarios.json");
        final response = await http.get(url);
        final data = json.decode(response.body) as Map<String, dynamic>;
        data.forEach((key, value) {
          //sacar las keys y valores de un mapa
          if (value["email"] == email) {
            String rol = value['rol'];
            if(rol == "user_admin"){
              Navigator.popAndPushNamed(context, 'tables');
            }else{
              Navigator.push(context, MaterialPageRoute(builder: (context) => appHome(emailSend)));
            }
          }
        });
      } else {
        Fluttertoast.showToast(
            msg: 'Contraseña o  correo erroneo',
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
