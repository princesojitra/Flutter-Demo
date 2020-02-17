import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:leca/utils/constants.dart';

part 'login_serialize.g.dart';

@JsonSerializable(explicitToJson: true)
class Login_Model {
  int status;
  String message;
  LoginData data;

  Login_Model(this.status, this.message, this.data);

  factory Login_Model.fromJson(Map<String, dynamic> json) => _$Login_ModelFromJson(json);

  Map<String, dynamic> toJson() => _$Login_ModelToJson(this);

  static Future<Login_Model> fetchLoginData({String email, String password}) async {
    var body = Map<String, dynamic>();
    body[LoginWsParms.email] = email;
    body[LoginWsParms.devicetype] = '1';
    body[LoginWsParms.devicetoken] = 'FCMKey';
    body[LoginWsParms.password] = password;

    final result = await http.post(Constants.BaseUrl + WS.Login, body: body);

    if (result.statusCode == 200) {
      return parsedLoginData(result.body);
    } else {
      print(result.toString());
      throw Exception('Unable to fetch data from server side');
    }
  }

  static Login_Model parsedLoginData(String body) {
    return Login_Model.fromJson(json.decode(body));
  }
}

class LoginWsParms {
  static final String email = 'username';
  static final String password = 'password';
  static final String devicetoken = 'device_token';
  static final String devicetype = 'device_type';
}

@JsonSerializable(explicitToJson: true)
class LoginData {
  @JsonKey(name: 'user_data')
  UserData userData;
  @JsonKey(name: 'company_data')
  CompanyData companyData;

  LoginData(this.userData, this.companyData);

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserData {
  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'user_id')
  int userID;

  @JsonKey(name: 'username')
  String userName;

  @JsonKey(name: 'role_id')
  int roleId;

  @JsonKey(name: 'role_name')
  String roleName;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'first_name')
  String firstName;

  @JsonKey(name: 'last_name')
  String lastName;

  @JsonKey(name: 'birth_date')
  String birthDate;

  @JsonKey(name: 'licence_no')
  String licenceNo;

  @JsonKey(name: 'mobile_number')
  String mobileNumber;

  @JsonKey(name: 'emergency_contact_no')
  String emergencyContactNo;

  @JsonKey(name: 'emergency_contact_name')
  String emergencyContactName;

  @JsonKey(name: 'address_line_1')
  String addressLine1;

  @JsonKey(name: 'address_line_2')
  String addressLine2;

  @JsonKey(name: 'suburb')
  String subrub;

  @JsonKey(name: 'state')
  String state;

  @JsonKey(name: 'post_code')
  int postCode;

  @JsonKey(name: 'profile_pic')
  String profilePic;

  @JsonKey(name: 'police_check')
  String policeCheck;

  @JsonKey(name: 'pdf_thumbnail')
  String pdfThumbnail;

  @JsonKey(name: 'mobile_number1')
  String mobileNumber1;

  UserData(
      this.accessToken,
      this.userID,
      this.userName,
      this.roleId,
      this.roleName,
      this.title,
      this.firstName,
      this.lastName,
      this.birthDate,
      this.licenceNo,
      this.addressLine1,
      this.addressLine2,
      this.mobileNumber,
      this.emergencyContactName,
      this.emergencyContactNo,
      this.subrub,
      this.state,
      this.postCode,
      this.profilePic,
      this.policeCheck,
      this.pdfThumbnail,
      this.email,
      this.mobileNumber1);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CompanyData {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'address_line_1')
  String addressLine1;

  @JsonKey(name: 'address_line_2')
  String addressLine2;

  @JsonKey(name: 'suburb')
  String suburb;

  @JsonKey(name: 'state')
  String state;

  @JsonKey(name: 'post_code')
  int postCode;

  @JsonKey(name: 'registered_address_line_1')
  String registeredAddressLine1;

  @JsonKey(name: 'registered_address_line_2')
  String registeredAddressLine2;

  @JsonKey(name: 'registered_suburb')
  String registeredSuburb;

  @JsonKey(name: 'registered_state')
  String registeredState;

  @JsonKey(name: 'registered_post_code')
  int registeredPostCode;

  @JsonKey(name: 'abn')
  String abn;

  @JsonKey(name: 'billing_first_name')
  String billingFirstName;

  @JsonKey(name: 'billing_last_name')
  String billingLastName;

  @JsonKey(name: 'billing_mobile_number')
  String billingMobileNumber;

  @JsonKey(name: 'service_id')
  String serviceId;

  @JsonKey(name: 'city_id')
  String cityId;

  @JsonKey(name: 'account_name')
  String accountName;

  @JsonKey(name: 'bsb')
  int bsb;

  @JsonKey(name: 'account_number')
  int accountNumber;

  @JsonKey(name: 'bank_name')
  String bankName;

  @JsonKey(name: 'pliability_insurance')
  String pliabilityInsurance;

  @JsonKey(name: 'driver_licence')
  String driverLicence;

  @JsonKey(name: 'police_check')
  String policeCheck;

  @JsonKey(name: 'operational_first_name')
  String operationalFirstName;

  @JsonKey(name: 'operational_last_name')
  String operationalLastName;

  @JsonKey(name: 'operational_email')
  String operationalEmail;

  @JsonKey(name: 'operational_mobile_number')
  String operationalMobileNumber;

  @JsonKey(name: 'method_id')
  String methodId;

  @JsonKey(name: 'credit_report')
  String creditReport;

  @JsonKey(name: 'professional_indemnity_insurance')
  String professionalIndemnityInsurance;

  @JsonKey(name: 'work_insurance')
  String workInsurance;

  CompanyData(
      {int id,
      String title,
      String addressLine1,
      String addressLine2,
      String suburb,
      String state,
      int postCode,
      String registeredAddressLine1,
      String registeredAddressLine2,
      String registeredSuburb,
      String registeredState,
      int registeredPostCode,
      String abn,
      String billingFirstName,
      String billingLastName,
      String billingMobileNumber,
      String serviceId,
      String cityId,
      String accountName,
      int bsb,
      int accountNumber,
      String bankName,
      String pliabilityInsurance,
      String driverLicence,
      String policeCheck,
      String operationalFirstName,
      String operationalLastName,
      String operationalEmail,
      String operationalMobileNumber,
      String methodId,
      String creditReport,
      String professionalIndemnityInsurance,
      String workInsurance}) {
    this.id = id;
    this.title = title;
    this.addressLine1 = addressLine1;
    this.addressLine2 = addressLine2;
    this.suburb = suburb;
    this.state = state;
    this.postCode = postCode;
    this.registeredAddressLine1 = registeredAddressLine1;
    this.registeredAddressLine2 = registeredAddressLine2;
    this.registeredSuburb = registeredSuburb;
    this.registeredState = registeredState;
    this.registeredPostCode = registeredPostCode;
    this.abn = abn;
    this.billingFirstName = billingFirstName;
    this.billingLastName = billingLastName;
    this.billingMobileNumber = billingMobileNumber;
    this.serviceId = serviceId;
    this.cityId = cityId;
    this.accountName = accountName;
    this.bsb = bsb;
    this.accountNumber = accountNumber;
    this.bankName = bankName;
    this.pliabilityInsurance = pliabilityInsurance;
    this.driverLicence = driverLicence;
    this.policeCheck = policeCheck;
    this.operationalFirstName = operationalFirstName;
    this.operationalLastName = operationalLastName;
    this.operationalEmail = operationalEmail;
    this.operationalMobileNumber = operationalMobileNumber;
    this.methodId = methodId;
    this.creditReport = creditReport;
    this.professionalIndemnityInsurance = professionalIndemnityInsurance;
    this.workInsurance = workInsurance;
  }

  factory CompanyData.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDataToJson(this);
}
