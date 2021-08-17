import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/desarrolladores_pages.dart';
import 'package:flutter_application_1/pages/notifypage.dart';
import 'package:flutter_application_1/pages/sensor.dart';
import 'package:flutter_application_1/pages/splash.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/registopage.dart';
import 'package:flutter_application_1/pages/logIn.dart';
import 'package:flutter_application_1/pages/formstreets.dart';
import 'package:flutter_application_1/pages/reportform.dart';
import 'package:flutter_application_1/pages/table.dart';
import 'package:flutter_application_1/pages/forgotupassword.dart';
import 'package:flutter_application_1/pages/about.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
  flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channel.description,
        ),
      ));
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
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
      initialRoute: 'tables',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashPage(duration: 3),
        'home' : (BuildContext context) => appHome(''),
        'login' : (BuildContext context) => loginPage(),
        'form' : (BuildContext context) => formPage(),
        'tables' : (BuildContext context) => tablesPage(),
        'reports' : (BuildContext context) => reportFormPage(),
        'forgotPass' : (BuildContext context) => ForgotPage(),
        'sensor' : (BuildContext context) => SensorPage(),
        'desarrolladores' : (BuildContext context) => DesarrolladoresPage(),
        'registro' : (BuildContext context) => RegistroPage(),
        'about' : (BuildContext context) => about(),
        'notify' : (BuildContext context) => NotifyPage()
      }
    );
  }
}
