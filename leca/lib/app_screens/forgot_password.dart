import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:leca/models/forgot_password_model.dart';
import 'package:leca/utils/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ForgotPasswordState();
  }
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditController = TextEditingController();
  bool _isEmailAutoValidate;
  bool _isLaoding;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isEmailAutoValidate = false;
    _isLaoding = false;
  }

  _CallForgotPasswordWS() async {
    try {
      final result = await ForgotPasswordModel.fetchResetPasswordData(
          emailTextEditController.text);
      if (result.status == 200) {
        Constants.showAlert(result.message, 'LECA', context, true);
        setState(() {
          _isLaoding = true;
        });
      } else {
        Constants.showAlert(result.message, 'LECA', context, false);
        setState(() {
          _isLaoding = false;
        });
      }
    } catch (error) {
      print(error.toString());
      Constants.showAlert(error.toString(), 'LECA', context, false);
      setState(() {
        _isLaoding = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    // TODO: implement build
    return Scaffold(
        body: ModalProgressHUD(
            inAsyncCall: _isLaoding,
            opacity: 0.0,
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 100.0),
                children: <Widget>[
                  Image.asset(
                    'assests/password.png',
                    width: 120.0,
                    height: 120.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text('Forgot Password?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold))),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text('Enter email id to receive instructions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                          ))),
                  Padding(
                      padding:
                          EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autovalidate: _isEmailAutoValidate,
                        cursorColor: Colors.lightGreen,
                        style: textStyle,
                        validator: (updatedValue) {
                          if (updatedValue.isEmpty) {
                            return 'Email can not be empty';
                          } else if (!EmailValidator.validate(updatedValue)) {
                            return 'Please enter valid email address';
                          }
                        },
                        controller: emailTextEditController,
                        decoration: InputDecoration(
                            hintText: 'abc@gmail.com',
                            suffixIcon: Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Image.asset(
                                  'assests/email.png',
                                  width: 20.0,
                                  height: 20.0,
                                )),
                            labelText: 'Email',
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15.0)),
                        onChanged: (updatedValue) {
                          setState(() {
                            _isEmailAutoValidate = true;
                          });
                        },
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                      child: SizedBox(
                        height: 45.0,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  print('reset button clicked');
                                  _isLaoding = true;
                                });
                                _CallForgotPasswordWS();
                              }
                            },
                            color: Color(0xFF747571),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Text('RESET PASSWORD',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: Image.asset('assests/backarow.png',
                                width: 25.0, height: 25.0),
                            onTap: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: GestureDetector(
                                child: Text('Back',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xFF33BBB6))),
                                onTap: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                              ))
                        ],
                      ))
                ],
              ),
              onWillPop: () {
                Navigator.pop(context);
              },
            )));
  }
}
