/// status : 200
/// message : "Success"
/// data : {"user_data":{"access_token":"--A0pjaoZFkqd_D2huQi-J9kt9RobsGj","user_id":329,"username":"cpconsultant@gmail.com","role_id":4,"role_name":"Channel Partner Consultant","title":"Mr.","email":"cpconsultant@gmail.com","first_name":"LECA","last_name":"Consulatant","birth_date":"12/12/2019","licence_no":"1212323","mobile_number":"1212121454","emergency_contact_name":"Consultant","emergency_contact_no":"654321654654","address_line_1":"147-149 Langtree Avenue","address_line_2":"","suburb":"MILDURA","state":"VIC","post_code":3500,"profile_pic":"http://php.dev.drcsystems.ooo/php-projects/leca/uploads/user_profile/329/58x58_1577450569profile_pic","police_check":"http://php.dev.drcsystems.ooo/php-projects/leca/uploads/user_document/329/police_check/1577450569_15.pdf","pdf_thumbnail":"http://php.dev.drcsystems.ooo/php-projects/leca/api/web/design_elements/images/mobile_pdf.png","driver_licence":"http://php.dev.drcsystems.ooo/php-projects/leca/uploads/driver_licence/329/1577450569_23.jpg","driver_licence_thumbnail":"http://php.dev.drcsystems.ooo/php-projects/leca/api/web/design_elements/images/driver_license.png"},"company_data":{"id":1,"title":"LECA"}}

class Demomodel {
  int _status;
  String _message;
  DataBean _data;

  int get status => _status;
  String get message => _message;
  DataBean get data => _data;

  Demomodel(this._status, this._message, this._data);

  Demomodel.map(dynamic obj) {
    this._status = obj["status"];
    this._message = obj["message"];
    this._data = obj["data"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["status"] = _status;
    map["message"] = _message;
    map["data"] = _data;
    return map;
  }

}

/// user_data : {"access_token":"--A0pjaoZFkqd_D2huQi-J9kt9RobsGj","user_id":329,"username":"cpconsultant@gmail.com","role_id":4,"role_name":"Channel Partner Consultant","title":"Mr.","email":"cpconsultant@gmail.com","first_name":"LECA","last_name":"Consulatant","birth_date":"12/12/2019","licence_no":"1212323","mobile_number":"1212121454","emergency_contact_name":"Consultant","emergency_contact_no":"654321654654","address_line_1":"147-149 Langtree Avenue","address_line_2":"","suburb":"MILDURA","state":"VIC","post_code":3500,"profile_pic":"http://php.dev.drcsystems.ooo/php-projects/leca/uploads/user_profile/329/58x58_1577450569profile_pic","police_check":"http://php.dev.drcsystems.ooo/php-projects/leca/uploads/user_document/329/police_check/1577450569_15.pdf","pdf_thumbnail":"http://php.dev.drcsystems.ooo/php-projects/leca/api/web/design_elements/images/mobile_pdf.png","driver_licence":"http://php.dev.drcsystems.ooo/php-projects/leca/uploads/driver_licence/329/1577450569_23.jpg","driver_licence_thumbnail":"http://php.dev.drcsystems.ooo/php-projects/leca/api/web/design_elements/images/driver_license.png"}
/// company_data : {"id":1,"title":"LECA"}

class DataBean {
  User_dataBean _userData;
  Company_dataBean _companyData;

  User_dataBean get userData => _userData;
  Company_dataBean get companyData => _companyData;

  DataBean(this._userData, this._companyData);

  DataBean.map(dynamic obj) {
    this._userData = obj["userData"];
    this._companyData = obj["companyData"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["userData"] = _userData;
    map["companyData"] = _companyData;
    return map;
  }

}

/// id : 1
/// title : "LECA"

class Company_dataBean {
  int _id;
  String _title;

  int get id => _id;
  String get title => _title;

  Company_dataBean(this._id, this._title);

  Company_dataBean.map(dynamic obj) {
    this._id = obj["id"];
    this._title = obj["title"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["title"] = _title;
    return map;
  }

}

/// access_token : "--A0pjaoZFkqd_D2huQi-J9kt9RobsGj"
/// user_id : 329
/// username : "cpconsultant@gmail.com"
/// role_id : 4
/// role_name : "Channel Partner Consultant"
/// title : "Mr."
/// email : "cpconsultant@gmail.com"
/// first_name : "LECA"
/// last_name : "Consulatant"
/// birth_date : "12/12/2019"
/// licence_no : "1212323"
/// mobile_number : "1212121454"
/// emergency_contact_name : "Consultant"
/// emergency_contact_no : "654321654654"
/// address_line_1 : "147-149 Langtree Avenue"
/// address_line_2 : ""
/// suburb : "MILDURA"
/// state : "VIC"
/// post_code : 3500
/// profile_pic : "http://php.dev.drcsystems.ooo/php-projects/leca/uploads/user_profile/329/58x58_1577450569profile_pic"
/// police_check : "http://php.dev.drcsystems.ooo/php-projects/leca/uploads/user_document/329/police_check/1577450569_15.pdf"
/// pdf_thumbnail : "http://php.dev.drcsystems.ooo/php-projects/leca/api/web/design_elements/images/mobile_pdf.png"
/// driver_licence : "http://php.dev.drcsystems.ooo/php-projects/leca/uploads/driver_licence/329/1577450569_23.jpg"
/// driver_licence_thumbnail : "http://php.dev.drcsystems.ooo/php-projects/leca/api/web/design_elements/images/driver_license.png"

class User_dataBean {
  String _accessToken;
  int _userId;
  String _username;
  int _roleId;
  String _roleName;
  String _title;
  String _email;
  String _firstName;
  String _lastName;
  String _birthDate;
  String _licenceNo;
  String _mobileNumber;
  String _emergencyContactName;
  String _emergencyContactNo;
  String _addressLine1;
  String _addressLine2;
  String _suburb;
  String _state;
  int _postCode;
  String _profilePic;
  String _policeCheck;
  String _pdfThumbnail;
  String _driverLicence;
  String _driverLicenceThumbnail;

  String get accessToken => _accessToken;
  int get userId => _userId;
  String get username => _username;
  int get roleId => _roleId;
  String get roleName => _roleName;
  String get title => _title;
  String get email => _email;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get birthDate => _birthDate;
  String get licenceNo => _licenceNo;
  String get mobileNumber => _mobileNumber;
  String get emergencyContactName => _emergencyContactName;
  String get emergencyContactNo => _emergencyContactNo;
  String get addressLine1 => _addressLine1;
  String get addressLine2 => _addressLine2;
  String get suburb => _suburb;
  String get state => _state;
  int get postCode => _postCode;
  String get profilePic => _profilePic;
  String get policeCheck => _policeCheck;
  String get pdfThumbnail => _pdfThumbnail;
  String get driverLicence => _driverLicence;
  String get driverLicenceThumbnail => _driverLicenceThumbnail;

  User_dataBean(this._accessToken, this._userId, this._username, this._roleId, this._roleName, this._title, this._email, this._firstName, this._lastName, this._birthDate, this._licenceNo, this._mobileNumber, this._emergencyContactName, this._emergencyContactNo, this._addressLine1, this._addressLine2, this._suburb, this._state, this._postCode, this._profilePic, this._policeCheck, this._pdfThumbnail, this._driverLicence, this._driverLicenceThumbnail);

  User_dataBean.map(dynamic obj) {
    this._accessToken = obj["accessToken"];
    this._userId = obj["userId"];
    this._username = obj["username"];
    this._roleId = obj["roleId"];
    this._roleName = obj["roleName"];
    this._title = obj["title"];
    this._email = obj["email"];
    this._firstName = obj["firstName"];
    this._lastName = obj["lastName"];
    this._birthDate = obj["birthDate"];
    this._licenceNo = obj["licenceNo"];
    this._mobileNumber = obj["mobileNumber"];
    this._emergencyContactName = obj["emergencyContactName"];
    this._emergencyContactNo = obj["emergencyContactNo"];
    this._addressLine1 = obj["addressLine1"];
    this._addressLine2 = obj["addressLine2"];
    this._suburb = obj["suburb"];
    this._state = obj["state"];
    this._postCode = obj["postCode"];
    this._profilePic = obj["profilePic"];
    this._policeCheck = obj["policeCheck"];
    this._pdfThumbnail = obj["pdfThumbnail"];
    this._driverLicence = obj["driverLicence"];
    this._driverLicenceThumbnail = obj["driverLicenceThumbnail"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["accessToken"] = _accessToken;
    map["userId"] = _userId;
    map["username"] = _username;
    map["roleId"] = _roleId;
    map["roleName"] = _roleName;
    map["title"] = _title;
    map["email"] = _email;
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["birthDate"] = _birthDate;
    map["licenceNo"] = _licenceNo;
    map["mobileNumber"] = _mobileNumber;
    map["emergencyContactName"] = _emergencyContactName;
    map["emergencyContactNo"] = _emergencyContactNo;
    map["addressLine1"] = _addressLine1;
    map["addressLine2"] = _addressLine2;
    map["suburb"] = _suburb;
    map["state"] = _state;
    map["postCode"] = _postCode;
    map["profilePic"] = _profilePic;
    map["policeCheck"] = _policeCheck;
    map["pdfThumbnail"] = _pdfThumbnail;
    map["driverLicence"] = _driverLicence;
    map["driverLicenceThumbnail"] = _driverLicenceThumbnail;
    return map;
  }

}