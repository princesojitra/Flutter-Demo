import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:leca/models/serialize/login_serialize.dart';
import 'package:leca/app_screens/forgotpassword.dart';
import 'package:leca/app_screens/mainmenu.dart';
import 'package:leca/utils/constants.dart';
import 'package:leca/app_screens/mainmenu.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextEditController = TextEditingController();
  TextEditingController _passwordTextEditController = TextEditingController();

  bool _isRememberMe;
  bool _autoValidateEmail;
  bool _autoValidatePassword;
  bool _isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isRememberMe = false;
    _autoValidateEmail = false;
    _autoValidatePassword = false;
    _isLoading = false;
    _emailTextEditController.text = 'cpconsultant@gmail.com';
    _passwordTextEditController.text = 'Drc@1234';
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    double screenWidth = MediaQuery.of(context).size.width;

    _navigateToForgotPasswordScreen() {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return ForgotPassword();
      }));
    }

    _navigateToDashborad() {
      //Using push named
      Navigator.pushNamed(context, MainMenu.routeName);

      //Using normal material page route
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return MainMenu();
//    }));
    }

    _callLoginWS() async {
      try {
        final loginResponse = await Login_Model.fetchLoginData(
            email: _emailTextEditController.text,
            password: _passwordTextEditController.text);

        print(loginResponse.toJson());

        if (loginResponse.status == 200) {
          SharedPref.save('UserLogin', loginResponse);
          setState(() {
            _isLoading = false;
          });

          _navigateToDashborad();
        } else {
          setState(() {
            _isLoading = false;
          });

          _navigateToDashborad();

          Constants.showAlert(
              title: Constants.AppName,
              context: context,
              message: loginResponse.message);
        }
      } catch (error) {
        setState(() {
          _isLoading = false;
        });

        _navigateToDashborad();

        Constants.showAlert(
            title: Constants.AppName,
            context: context,
            message: error.toString());
      }
    }

    // TODO: implement build
    return ModalProgressHUD(
        inAsyncCall: _isLoading,
        opacity: 0.0,
        progressIndicator: CircularProgressIndicator(),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 50.0),
            children: <Widget>[
              Image.asset(
                'assests/logo.png',
                width: 200.0,
                height: 200.0,
              ),
              Column(
                children: <Widget>[
                  Padding(
                      padding:
                          EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
                      child: TextFormField(
                        autovalidate: _autoValidateEmail,
                        cursorColor: Colors.lightGreen,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailTextEditController,
                        style: textStyle,
                        validator: (inputString) {
                          if (inputString.isEmpty) {
                            return Constants.VALIDATE_EmailEmpty;
                          } else if (!EmailValidator.validate(inputString)) {
                            return Constants.VALIDATE_Email;
                          } else {
                            return null;
                          }
                        },
                        onChanged: (updatedValue) {
                          setState(() {
                            _autoValidateEmail = true;
                          });
                        },
                        decoration: InputDecoration(
                          // hintText: 'example@gmail.com',
                          labelText: 'Email',
                          suffixIcon: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Image.asset('assests/email.png'),
                            width: 20.0,
                            height: 20.0,
                          ),
                          errorStyle:
                              TextStyle(color: Colors.red, fontSize: 15.0),
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                      child: TextFormField(
                        cursorColor: Colors.lightGreen,
                        autovalidate: _autoValidatePassword,
                        keyboardType: TextInputType.emailAddress,
                        controller: _passwordTextEditController,
                        style: textStyle,
                        validator: (inputString) {
                          if (inputString.isEmpty) {
                            return Constants.VALIDATE_PasswordEmpty;
                          } else {
                            return null;
                          }
                        },
                        onChanged: (updatedValue) {
                          setState(() {
                            _autoValidatePassword = true;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Drc@1234',
                          labelText: 'Password',
                          suffixIcon: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Image.asset('assests/password.png'),
                            width: 12.0,
                            height: 12.0,
                          ),
                          errorStyle:
                              TextStyle(color: Colors.red, fontSize: 15.0),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, left: 13.0, bottom: 15.0, right: 30.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Checkbox(
                              value: _isRememberMe,
                              onChanged: (newValue) {
                                setState(() {
                                  _isRememberMe = newValue;
                                });
                              },
                              activeColor: Colors.lightGreen,
                            ),
                            GestureDetector(
                              child: Text(
                                'Remember me',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 15.0),
                              ),
                              onTap: () {
                                setState(() {
                                  if (_isRememberMe) {
                                    _isRememberMe = false;
                                  } else {
                                    _isRememberMe = true;
                                  }
                                });
                              },
                            ),
                            Expanded(
                                child: GestureDetector(
                              child: Text('Forgot password?',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: 15.0,
                                      backgroundColor: Colors.white)),
                              onTap: () {
                                setState(() {
                                  print('forgot button tapped');
                                  _navigateToForgotPasswordScreen();
                                });
                              },
                            )),
                          ])),
                  Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                      child: SizedBox(
                          width: screenWidth,
                          height: 45.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            elevation: 5.0,
                            color: Color(0xFF747571),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  print('all validations are checked');
                                  _isLoading = true;
                                });
                                _callLoginWS();
                              }
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))),
                ],
              ),
            ],
          ),
        ));
  }
}
