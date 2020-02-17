import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leca/utils/constants.dart';

class ForgotPasswordModel {
  int _status;
  String _message;

  ForgotPasswordModel(this._message, this._status);

  //getter
  int get status => _status;

  String get message => _message;

  //setter

  set status(int status) => _status = status;

  set message(String message) => _message = message;

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    this._status = json['status'];
    this._message = json['message'];
  }

  Map<String, dynamic> toJosn() {
    Map<String, dynamic> json = Map<String, dynamic>();
    json['status'] = this._status;
    json['message'] = this._message;
    return json;
  }

  static Future<ForgotPasswordModel> fetchResetPasswordData(
      String email) async {
    Map<String, dynamic> body = Map<String, dynamic>();
    body[ForgotPasswordParms.email] = email;

    final result =
        await http.post(Constants.BaseUrl + WS.ForgotPassword, body: body);

    if (result.statusCode == 200) {
      return parseData(result.body);
    } else {
      throw Exception('Unable to fetch data from server side');
    }
  }

  static ForgotPasswordModel parseData(String body) {
    final parsedData = ForgotPasswordModel.fromJson(json.decode(body));
    return parsedData;
  }
}

class ForgotPasswordParms {
  static final String email = 'email';
}
