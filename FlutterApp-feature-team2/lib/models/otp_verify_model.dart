class OtpVerifyRequestModel {
  OtpVerifyRequestModel({
    required this.phoneNumber,
    required this.otp,
    required this.hash,
  });
  late final String phoneNumber;
  late final String otp;
  late final String hash;
  
  OtpVerifyRequestModel.fromJson(Map<String, dynamic> json){
    phoneNumber = json['phoneNumber'];
    otp = json['otp'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['phoneNumber'] = phoneNumber;
    _data['otp'] = otp;
    _data['hash'] = hash;
    return _data;
  }
}