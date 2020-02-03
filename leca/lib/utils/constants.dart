import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Constants {
  static final BaseUrl =
      'http://php.dev.drcsystems.ooo:8083/php-projects/leca/api/v1/webservices/';

  static showAlert(
      String message, String title, BuildContext context, bool isPop) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        child: Text(
                          'OK',
                          style: TextStyle(fontSize: 17.0, color: Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (isPop) {
                            Navigator.pop(context);
                          }
                        }),
                  ])),
        ],
      ),
      elevation: 50.0,
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}

class SharedPref {
 static read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  static save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

 static remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

class WS {
  static final Login = 'login';
  static final ForgotPassword = 'forgotpassword';
}
