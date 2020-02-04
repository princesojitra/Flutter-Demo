// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_serialize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login_Model _$Login_ModelFromJson(Map<String, dynamic> json) {
  return Login_Model(
    json['status'] as int,
    json['message'] as String,
    json['data'] == null
        ? null
        : LoginData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$Login_ModelToJson(Login_Model instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) {
  return LoginData(
    json['user_data'] == null
        ? null
        : UserData.fromJson(json['user_data'] as Map<String, dynamic>),
    json['company_data'] == null
        ? null
        : CompanyData.fromJson(json['company_data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'user_data': instance.userData?.toJson(),
      'company_data': instance.companyData?.toJson(),
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    json['access_token'] as String,
    json['user_id'] as int,
    json['username'] as String,
    json['role_id'] as int,
    json['role_name'] as String,
    json['title'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['birth_date'] as String,
    json['licence_no'] as String,
    json['address_line_1'] as String,
    json['address_line_2'] as String,
    json['mobile_number'] as String,
    json['emergency_contact_name'] as String,
    json['emergency_contact_no'] as String,
    json['suburb'] as String,
    json['state'] as String,
    json['post_code'] as int,
    json['profile_pic'] as String,
    json['police_check'] as String,
    json['pdf_thumbnail'] as String,
    json['email'] as String,
    json['mobile_number1'] as String,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'user_id': instance.userID,
      'username': instance.userName,
      'role_id': instance.roleId,
      'role_name': instance.roleName,
      'email': instance.email,
      'title': instance.title,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birth_date': instance.birthDate,
      'licence_no': instance.licenceNo,
      'mobile_number': instance.mobileNumber,
      'emergency_contact_no': instance.emergencyContactNo,
      'emergency_contact_name': instance.emergencyContactName,
      'address_line_1': instance.addressLine1,
      'address_line_2': instance.addressLine2,
      'suburb': instance.subrub,
      'state': instance.state,
      'post_code': instance.postCode,
      'profile_pic': instance.profilePic,
      'police_check': instance.policeCheck,
      'pdf_thumbnail': instance.pdfThumbnail,
      'mobile_number1': instance.mobileNumber1,
    };

CompanyData _$CompanyDataFromJson(Map<String, dynamic> json) {
  return CompanyData(
    id: json['id'] as int,
    title: json['title'] as String,
    addressLine1: json['address_line_1'] as String,
    addressLine2: json['address_line_2'] as String,
    suburb: json['suburb'] as String,
    state: json['state'] as String,
    postCode: json['post_code'] as int,
    registeredAddressLine1: json['registered_address_line_1'] as String,
    registeredAddressLine2: json['registered_address_line_2'] as String,
    registeredSuburb: json['registered_suburb'] as String,
    registeredState: json['registered_state'] as String,
    registeredPostCode: json['registered_post_code'] as int,
    abn: json['abn'] as String,
    billingFirstName: json['billing_first_name'] as String,
    billingLastName: json['billing_last_name'] as String,
    billingMobileNumber: json['billing_mobile_number'] as String,
    serviceId: json['service_id'] as String,
    cityId: json['city_id'] as String,
    accountName: json['account_name'] as String,
    bsb: json['bsb'] as int,
    accountNumber: json['account_number'] as int,
    bankName: json['bank_name'] as String,
    pliabilityInsurance: json['pliability_insurance'] as String,
    driverLicence: json['driver_licence'] as String,
    policeCheck: json['police_check'] as String,
    operationalFirstName: json['operational_first_name'] as String,
    operationalLastName: json['operational_last_name'] as String,
    operationalEmail: json['operational_email'] as String,
    operationalMobileNumber: json['operational_mobile_number'] as String,
    methodId: json['method_id'] as String,
    creditReport: json['credit_report'] as String,
    professionalIndemnityInsurance:
        json['professional_indemnity_insurance'] as String,
    workInsurance: json['work_insurance'] as String,
  );
}

Map<String, dynamic> _$CompanyDataToJson(CompanyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'address_line_1': instance.addressLine1,
      'address_line_2': instance.addressLine2,
      'suburb': instance.suburb,
      'state': instance.state,
      'post_code': instance.postCode,
      'registered_address_line_1': instance.registeredAddressLine1,
      'registered_address_line_2': instance.registeredAddressLine2,
      'registered_suburb': instance.registeredSuburb,
      'registered_state': instance.registeredState,
      'registered_post_code': instance.registeredPostCode,
      'abn': instance.abn,
      'billing_first_name': instance.billingFirstName,
      'billing_last_name': instance.billingLastName,
      'billing_mobile_number': instance.billingMobileNumber,
      'service_id': instance.serviceId,
      'city_id': instance.cityId,
      'account_name': instance.accountName,
      'bsb': instance.bsb,
      'account_number': instance.accountNumber,
      'bank_name': instance.bankName,
      'pliability_insurance': instance.pliabilityInsurance,
      'driver_licence': instance.driverLicence,
      'police_check': instance.policeCheck,
      'operational_first_name': instance.operationalFirstName,
      'operational_last_name': instance.operationalLastName,
      'operational_email': instance.operationalEmail,
      'operational_mobile_number': instance.operationalMobileNumber,
      'method_id': instance.methodId,
      'credit_report': instance.creditReport,
      'professional_indemnity_insurance':
          instance.professionalIndemnityInsurance,
      'work_insurance': instance.workInsurance,
    };
