import 'package:flutter/material.dart';
import 'package:leca/app_screens/dashboard.dart';
import 'package:leca/app_screens/login.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'models/serialize/login_serialize.dart';
import 'dart:async';
import 'utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
void main() async {
  Widget _defaultHome = new Login();

//  final prefs = await SharedPreferences.getInstance();
//  Login_Model loginResponse =
//      Login_Model.fromJson(json.decode(prefs.getString('userLogin')));
//
//  var _result = await loadLoginResponseFromSharedPrefe();
////  if (_result != null) {
////    _defaultHome = new Dashboard();
//  }
  runApp(LecaApp(
    defaultHome: _defaultHome,
  ));
}

Future<bool> loadLoginResponseFromSharedPrefe() async {
  try {
    Login_Model loginResponse =
        Login_Model.fromJson(await SharedPref.read('UserLogin'));
    print(loginResponse.toJson());
    return true;
  } catch (error) {
    print(error.toString());
    return false;
  }
}

class LecaApp extends StatelessWidget {
  final Widget defaultHome;

  LecaApp({this.defaultHome});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LECA',
      theme: ThemeData(
        accentColor: Colors.lightGreen,
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
      home: Scaffold(body: defaultHome),
      routes: <String, WidgetBuilder>{
        // Set routes for using the Navigator.
        '/login': (BuildContext context) => new Login(),
        '/dashboard': (BuildContext context) => new Dashboard()
      },
    );
  }
}
