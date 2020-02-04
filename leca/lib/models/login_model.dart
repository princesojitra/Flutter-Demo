import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:leca/utils/constants.dart';



class LoginModel {
  int _status;
  String _message;
  LoginData _data;

  LoginModel(this._status, this._message, this._data);

  //getter
  int get status => _status;

  String get message => _message;

  LoginData get data => _data;

  //setter
  set status(int status) => _status = status;

  set message(String message) => _message = message;

  set data(LoginData data) => _data = data;



  //FromJson

  LoginModel.fromnJson(Map<String, dynamic> json) {
    this._status = json['status'];
    this._message = json['message'];

    if (json['data'] != null) {
      this._data = LoginData.fromJson(json['data']);
    } else {
      this._data = null;
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map<String, dynamic>();
    json['status'] = this.status;
    json['message'] = this.message;
    json['data'] = this.data;
    return json;
  }

  static Future<LoginModel> fetchLoginData(
      {String email, String password}) async {
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

  static LoginModel parsedLoginData(String body) {
    return LoginModel.fromnJson(json.decode(body));
  }
}

class LoginWsParms {
  static final String email = 'username';
  static final String password = 'password';
  static final String devicetoken = 'device_token';
  static final String devicetype = 'device_type';
}

class LoginData {
  UserData _userData;
  CompanyData _companyData;

  LoginData(this._userData, this._companyData);

  //getter
  UserData get userData => _userData;

  CompanyData get companyData => _companyData;

  //setter
  set userData(UserData data) => _userData = data;

  set companyData(CompanyData data) => _companyData = data;

  LoginData.fromJson(Map<String, dynamic> json) {
    this._userData = (json['user_data'] != null)
        ? UserData.fromJson(json['user_data'])
        : null;
    this._companyData = (json['company_data'] != null)
        ? CompanyData.fromJson(json['company_data'])
        : null;
  }

  Map<String, dynamic> toJosn() {
    Map<String, dynamic> json = Map<String, dynamic>();
    json['user_data'] = this._userData;
    json['company_data'] = this._companyData;
    return json;
  }
}

class UserData {
  String _accessToken;
  int _userID;
  String _userName;
  int _roleId;
  String _roleName;
  String _email;
  String _title;
  String _firstName;
  String _lastName;
  String _birthDate;
  String _licenceNo;
  String _mobileNumber;
  String _emergencyContactNo;
  String _emergencyContactName;
  String _addressLine1;
  String _addressLine2;
  String _subrub;
  String _state;
  int _postCode;
  String _profilePic;
  String _policeCheck;
  String _pdfThumbnail;
  String _mobileNumber1;

  UserData(
      this._accessToken,
      this._userID,
      this._userName,
      this._roleId,
      this._roleName,
      this._title,
      this._firstName,
      this._lastName,
      this._birthDate,
      this._licenceNo,
      this._addressLine1,
      this._addressLine2,
      this._mobileNumber,
      this._emergencyContactName,
      this._emergencyContactNo,
      this._subrub,
      this._state,
      this._postCode,
      this._profilePic,
      this._policeCheck,
      this._pdfThumbnail,
      this._email,
      this._mobileNumber1);

  //getter
  String get accessToken => _accessToken;

  int get userID => _userID;

  String get userName => _userName;

  int get roleId => _roleId;

  String get roleName => _roleName;

  String get title => _title;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get birthDate => _birthDate;

  String get licenceNo => _licenceNo;

  String get mobileNumber => _mobileNumber;

  String get mobileNumber1 => _mobileNumber1;

  String get emergencyContactNo => _emergencyContactNo;

  String get emergencyContactName => _emergencyContactName;

  String get addressLine1 => _addressLine1;

  String get addressLine2 => _addressLine2;

  String get subrub => _subrub;

  String get state => _state;

  int get postCode => _postCode;

  String get profilePic => _profilePic;

  String get policeCheck => _policeCheck;

  String get pdfThumnail => _pdfThumbnail;

  String get email => _email;

  //setter
  set accessToken(String accessToken) => _accessToken = accessToken;

  set userID(int userID) => _userID = userID;

  set userName(String userName) => _userName = userName;

  set roleId(int roleId) => _roleId = roleId;

  set roleName(String roleName) => _roleName = roleName;

  set title(String title) => _title = title;

  set firstName(String firstName) => _firstName = firstName;

  set lastName(String lastName) => _lastName = lastName;

  set birthDate(String birthDate) => _birthDate = birthDate;

  set licenceNo(String licenceNo) => _licenceNo = licenceNo;

  set mobileNumber(String mobileNumber) => _mobileNumber = mobileNumber;

  set mobileNumber1(String mobileNumber1) => _mobileNumber1 = mobileNumber1;

  set emergencyContactNo(String emergencyContactNo) =>
      _emergencyContactNo = emergencyContactNo;

  set emergencyContactName(String emergencyContactName) =>
      _emergencyContactName = emergencyContactName;

  set addressLine1(String addressLine1) => _addressLine1 = addressLine1;

  set addressLine2(String addressLine2) => _addressLine2 = addressLine2;

  set subrub(String subrub) => _subrub = subrub;

  set state(String state) => _state = state;

  set postCode(int postCode) => _postCode = postCode;

  set profilePic(String profilePic) => _profilePic = profilePic;

  set policeCheck(String policeCheck) => _policeCheck = policeCheck;

  set pdfThumnail(String pdfThumnail) => _pdfThumbnail = pdfThumnail;

  set email(String email) => _email = email;

  UserData.fromJson(Map<String, dynamic> json) {
    this._accessToken = json['access_token'];
    this._userID = json['user_id'];
    this.userName = json['username'];
    this._roleId = json['role_id'];
    this._roleName = json['role_name'];
    this._title = json['title'];
    this._email = json['email'];
    this._firstName = json['first_name'];
    this._lastName = json['last_name'];
    this._birthDate = json['birth_date'];
    this._licenceNo = json['licence_no'];
    this._mobileNumber = json['mobile_number'];
    this._mobileNumber1 = json['mobile_number'];
    this._addressLine1 = json['address_line_1'];
    this._addressLine2 = json['address_line_2'];
    this._subrub = json['suburb'];
    this._state = json['state'];
    this._postCode = json['post_code'];
    this._profilePic = json['profile_pic'];
    this._policeCheck = json['police_check'];
    this._pdfThumbnail = json['pdf_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map<String, dynamic>();

    json['access_token'] = this._accessToken;
    json['user_id'] = this._userID;
    json['username'] = this._userName;
    json['role_id'] = this._roleId;
    json['role_name'] = this._roleName;
    json['title'] = this._title;
    json['email'] = this._email;
    json['first_name'] = this._firstName;
    json['last_name'] = this._lastName;
    json['birth_date'] = this._birthDate;
    json['licence_no'] = this._licenceNo;
    json['mobile_number'] = this.mobileNumber;
    json['mobile_number'] = this._mobileNumber1;
    json['address_line_1'] = this._addressLine1;
    json['address_line_2'] = this._addressLine2;
    json['suburb'] = this._subrub;
    json['state'] = this._state;
    json['post_code'] = this.postCode;
    json['profile_pic'] = this._profilePic;
    json['police_check'] = this._policeCheck;
    json['pdf_thumbnail'] = this.pdfThumnail;

    return json;
  }
}

class CompanyData {
  int _id;
  String _title;
  String _addressLine1;
  String _addressLine2;
  String _suburb;
  String _state;
  int _postCode;
  String _registeredAddressLine1;
  String _registeredAddressLine2;
  String _registeredSuburb;
  String _registeredState;
  int _registeredPostCode;
  String _abn;
  String _billingFirstName;
  String _billingLastName;
  String _billingMobileNumber;
  String _serviceId;
  String _cityId;
  String _accountName;
  int _bsb;
  int _accountNumber;
  String _bankName;
  String _pliabilityInsurance;
  String _driverLicence;
  String _policeCheck;
  String _operationalFirstName;
  String _operationalLastName;
  String _operationalEmail;
  String _operationalMobileNumber;
  String _methodId;
  String _creditReport;
  String _professionalIndemnityInsurance;
  String _workInsurance;

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
    this._id = id;
    this._title = title;
    this._addressLine1 = addressLine1;
    this._addressLine2 = addressLine2;
    this._suburb = suburb;
    this._state = state;
    this._postCode = postCode;
    this._registeredAddressLine1 = registeredAddressLine1;
    this._registeredAddressLine2 = registeredAddressLine2;
    this._registeredSuburb = registeredSuburb;
    this._registeredState = registeredState;
    this._registeredPostCode = registeredPostCode;
    this._abn = abn;
    this._billingFirstName = billingFirstName;
    this._billingLastName = billingLastName;
    this._billingMobileNumber = billingMobileNumber;
    this._serviceId = serviceId;
    this._cityId = cityId;
    this._accountName = accountName;
    this._bsb = bsb;
    this._accountNumber = accountNumber;
    this._bankName = bankName;
    this._pliabilityInsurance = pliabilityInsurance;
    this._driverLicence = driverLicence;
    this._policeCheck = policeCheck;
    this._operationalFirstName = operationalFirstName;
    this._operationalLastName = operationalLastName;
    this._operationalEmail = operationalEmail;
    this._operationalMobileNumber = operationalMobileNumber;
    this._methodId = methodId;
    this._creditReport = creditReport;
    this._professionalIndemnityInsurance = professionalIndemnityInsurance;
    this._workInsurance = workInsurance;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get title => _title;

  set title(String title) => _title = title;

  String get addressLine1 => _addressLine1;

  set addressLine1(String addressLine1) => _addressLine1 = addressLine1;

  String get addressLine2 => _addressLine2;

  set addressLine2(String addressLine2) => _addressLine2 = addressLine2;

  String get suburb => _suburb;

  set suburb(String suburb) => _suburb = suburb;

  String get state => _state;

  set state(String state) => _state = state;

  int get postCode => _postCode;

  set postCode(int postCode) => _postCode = postCode;

  String get registeredAddressLine1 => _registeredAddressLine1;

  set registeredAddressLine1(String registeredAddressLine1) =>
      _registeredAddressLine1 = registeredAddressLine1;

  String get registeredAddressLine2 => _registeredAddressLine2;

  set registeredAddressLine2(String registeredAddressLine2) =>
      _registeredAddressLine2 = registeredAddressLine2;

  String get registeredSuburb => _registeredSuburb;

  set registeredSuburb(String registeredSuburb) =>
      _registeredSuburb = registeredSuburb;

  String get registeredState => _registeredState;

  set registeredState(String registeredState) =>
      _registeredState = registeredState;

  int get registeredPostCode => _registeredPostCode;

  set registeredPostCode(int registeredPostCode) =>
      _registeredPostCode = registeredPostCode;

  String get abn => _abn;

  set abn(String abn) => _abn = abn;

  String get billingFirstName => _billingFirstName;

  set billingFirstName(String billingFirstName) =>
      _billingFirstName = billingFirstName;

  String get billingLastName => _billingLastName;

  set billingLastName(String billingLastName) =>
      _billingLastName = billingLastName;

  String get billingMobileNumber => _billingMobileNumber;

  set billingMobileNumber(String billingMobileNumber) =>
      _billingMobileNumber = billingMobileNumber;

  String get serviceId => _serviceId;

  set serviceId(String serviceId) => _serviceId = serviceId;

  String get cityId => _cityId;

  set cityId(String cityId) => _cityId = cityId;

  String get accountName => _accountName;

  set accountName(String accountName) => _accountName = accountName;

  int get bsb => _bsb;

  set bsb(int bsb) => _bsb = bsb;

  int get accountNumber => _accountNumber;

  set accountNumber(int accountNumber) => _accountNumber = accountNumber;

  String get bankName => _bankName;

  set bankName(String bankName) => _bankName = bankName;

  String get pliabilityInsurance => _pliabilityInsurance;

  set pliabilityInsurance(String pliabilityInsurance) =>
      _pliabilityInsurance = pliabilityInsurance;

  String get driverLicence => _driverLicence;

  set driverLicence(String driverLicence) => _driverLicence = driverLicence;

  String get policeCheck => _policeCheck;

  set policeCheck(String policeCheck) => _policeCheck = policeCheck;

  String get operationalFirstName => _operationalFirstName;

  set operationalFirstName(String operationalFirstName) =>
      _operationalFirstName = operationalFirstName;

  String get operationalLastName => _operationalLastName;

  set operationalLastName(String operationalLastName) =>
      _operationalLastName = operationalLastName;

  String get operationalEmail => _operationalEmail;

  set operationalEmail(String operationalEmail) =>
      _operationalEmail = operationalEmail;

  String get operationalMobileNumber => _operationalMobileNumber;

  set operationalMobileNumber(String operationalMobileNumber) =>
      _operationalMobileNumber = operationalMobileNumber;

  String get methodId => _methodId;

  set methodId(String methodId) => _methodId = methodId;

  String get creditReport => _creditReport;

  set creditReport(String creditReport) => _creditReport = creditReport;

  String get professionalIndemnityInsurance => _professionalIndemnityInsurance;

  set professionalIndemnityInsurance(String professionalIndemnityInsurance) =>
      _professionalIndemnityInsurance = professionalIndemnityInsurance;

  String get workInsurance => _workInsurance;

  set workInsurance(String workInsurance) => _workInsurance = workInsurance;

  CompanyData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _addressLine1 = json['address_line_1'];
    _addressLine2 = json['address_line_2'];
    _suburb = json['suburb'];
    _state = json['state'];
    _postCode = json['post_code'];
    _registeredAddressLine1 = json['registered_address_line_1'];
    _registeredAddressLine2 = json['registered_address_line_2'];
    _registeredSuburb = json['registered_suburb'];
    _registeredState = json['registered_state'];
    _registeredPostCode = json['registered_post_code'];
    _abn = json['abn'];
    _billingFirstName = json['billing_first_name'];
    _billingLastName = json['billing_last_name'];
    _billingMobileNumber = json['billing_mobile_number'];
    _serviceId = json['service_id'];
    _cityId = json['city_id'];
    _accountName = json['account_name'];
    _bsb = json['bsb'];
    _accountNumber = json['account_number'];
    _bankName = json['bank_name'];
    _pliabilityInsurance = json['pliability_insurance'];
    _driverLicence = json['driver_licence'];
    _policeCheck = json['police_check'];
    _operationalFirstName = json['operational_first_name'];
    _operationalLastName = json['operational_last_name'];
    _operationalEmail = json['operational_email'];
    _operationalMobileNumber = json['operational_mobile_number'];
    _methodId = json['method_id'];
    _creditReport = json['credit_report'];
    _professionalIndemnityInsurance = json['professional_indemnity_insurance'];
    _workInsurance = json['work_insurance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['address_line_1'] = this._addressLine1;
    data['address_line_2'] = this._addressLine2;
    data['suburb'] = this._suburb;
    data['state'] = this._state;
    data['post_code'] = this._postCode;
    data['registered_address_line_1'] = this._registeredAddressLine1;
    data['registered_address_line_2'] = this._registeredAddressLine2;
    data['registered_suburb'] = this._registeredSuburb;
    data['registered_state'] = this._registeredState;
    data['registered_post_code'] = this._registeredPostCode;
    data['abn'] = this._abn;
    data['billing_first_name'] = this._billingFirstName;
    data['billing_last_name'] = this._billingLastName;
    data['billing_mobile_number'] = this._billingMobileNumber;
    data['service_id'] = this._serviceId;
    data['city_id'] = this._cityId;
    data['account_name'] = this._accountName;
    data['bsb'] = this._bsb;
    data['account_number'] = this._accountNumber;
    data['bank_name'] = this._bankName;
    data['pliability_insurance'] = this._pliabilityInsurance;
    data['driver_licence'] = this._driverLicence;
    data['police_check'] = this._policeCheck;
    data['operational_first_name'] = this._operationalFirstName;
    data['operational_last_name'] = this._operationalLastName;
    data['operational_email'] = this._operationalEmail;
    data['operational_mobile_number'] = this._operationalMobileNumber;
    data['method_id'] = this._methodId;
    data['credit_report'] = this._creditReport;
    data['professional_indemnity_insurance'] =
        this._professionalIndemnityInsurance;
    data['work_insurance'] = this._workInsurance;
    return data;
  }
}
