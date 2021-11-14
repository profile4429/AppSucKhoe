class LoginRequestModel {
  LoginRequestModel({
    required this.phoneNumber,
    required this.email,
    required this.password,
  });
  late final String phoneNumber;
  late final String email;
  late final String password;

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (phoneNumber.isNotEmpty) {
      _data['phoneNumber'] = phoneNumber;
    }
    if (email.isNotEmpty) {
      _data['email'] = email;
    }
    _data['password'] = password;
    return _data;
  }
}
