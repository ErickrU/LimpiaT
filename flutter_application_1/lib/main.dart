import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/sensor.dart';
import 'package:flutter_application_1/pages/splash.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/logIn.dart';
import 'package:flutter_application_1/pages/formstreets.dart';
import 'package:flutter_application_1/pages/reportform.dart';
import 'package:flutter_application_1/pages/table.dart';
import 'package:flutter_application_1/pages/forgotupassword.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashPage(duration: 3),
        'home' : (BuildContext context) => appHome(''),
        'login' : (BuildContext context) => loginPage(),
        'form' : (BuildContext context) => formPage(),
        'tables' : (BuildContext context) => tablesPage(),
        'reports' : (BuildContext context) => reportFormPage(),
        'forgotPass' : (BuildContext context) => ForgotPage(),
        'sensor' : (BuildContext context) => SensorPage(),
      }
    );
  }
}
