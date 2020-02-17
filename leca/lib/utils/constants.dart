import 'package:flutter/material.dart';
import 'package:leca/models/serialize/login_serialize.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';
import 'package:leca/models/serialize/login_serialize.dart';

class Constants {
  static final BaseUrl =
      'http://php.dev.drcsystems.ooo/php-projects/leca/api/v1/webservices/';
  static final AppName = 'LECA';

  static final ALERT_LogOut = 'Are you sure you want to logout?';

  static final VALIDATE_EmailEmpty = 'Email can not be empty';
  static final VALIDATE_Email = 'Please enter valid email address';
  static final VALIDATE_PasswordEmpty = 'Password can not be empty';

  static showAlert(
      {String message = '',
      String title = '',
      BuildContext context,
      bool isPop = false,
      bool isTwoButton = false,
      String firstBtnTitle = 'OK',
      String secondBtnTitle = '',
      Function firstBtnAction,
      Function secondBtnAction}) {
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
                        firstBtnTitle,
                        style: TextStyle(fontSize: 17.0, color: Colors.blue),
                      ),
                      onPressed: () {
                        if (firstBtnAction == null) {
                          Navigator.pop(context);
                        } else {
                          firstBtnAction();
                        }
                      },
                      highlightColor: Colors.white,
                      splashColor: Colors.white,
                    ),
                    isTwoButton
                        ? FlatButton(
                            child: Text(
                              secondBtnTitle,
                              style:
                                  TextStyle(fontSize: 17.0, color: Colors.blue),
                            ),
                            onPressed: () {
                              secondBtnAction();
                            },
                            highlightColor: Colors.white,
                            splashColor: Colors.white,
                          )
                        : Container()
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
