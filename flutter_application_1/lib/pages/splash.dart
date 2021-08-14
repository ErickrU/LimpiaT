import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  int? duration = 0;

  SplashPage({ this.duration });

  @override 
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration!), () async {
      Navigator.popAndPushNamed(context, "login");
    });

    return Material(
      child: Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Align(
              child: Icon(
                Icons.spa,
                color: Colors.white,
                size: 80
              ),
            alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.5)),
              ),
            ),
            )
          ],
        )
      )
    );
  }
}