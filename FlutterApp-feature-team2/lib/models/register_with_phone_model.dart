class RegisterPhoneRequestModel {
  RegisterPhoneRequestModel({
    required this.fullname,
    required this.phoneNumber,
    required this.gender,
    required this.password,
    required this.dateOfBirth,
    required this.isLoginWithEmail,
    required this.isLoginWithPhone,
  });
  late final String fullname;
  late final String phoneNumber;
  late final String gender;
  late final String password;
  late final String dateOfBirth;
  late final bool isLoginWithEmail;
  late final bool isLoginWithPhone;

  RegisterPhoneRequestModel.fromJson(Map<String, dynamic> json) {
    isLoginWithEmail = json['isLoginWithEmail'];
    isLoginWithPhone = json['isLoginWithPhone'];
    fullname = json['fullname'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    password = json['password'];
    dateOfBirth = json['dateOfBirth'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isLoginWithEmail'] = isLoginWithEmail;
    _data['isLoginWithPhone'] = isLoginWithPhone;
    _data['fullname'] = fullname;
    _data['phoneNumber'] = phoneNumber;
    _data['gender'] = gender;
    _data['password'] = password;
    _data['dateOfBirth'] = dateOfBirth;
    return _data;
  }
}
