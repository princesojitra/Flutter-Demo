import 'package:flutter/material.dart';
import 'package:leca/app_screens/login.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  runApp(LecaApp());
}

class LecaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LECA',
      theme: ThemeData(
          primaryColor: Colors.lightGreen,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              color: Colors.lightGreen,
              textTheme: TextTheme(
                  title: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              iconTheme: IconThemeData(color: Colors.white))),
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}
