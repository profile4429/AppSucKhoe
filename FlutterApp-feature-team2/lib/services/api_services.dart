import 'dart:convert';

import 'package:flutter_mental_health/configs/app_config.dart';
import 'package:flutter_mental_health/models/login_request_model.dart';
import 'package:flutter_mental_health/models/otp_signup_model.dart';
import 'package:flutter_mental_health/models/otp_verify_model.dart';
import 'package:flutter_mental_health/models/otp_verify_model.dart';
import 'package:flutter_mental_health/models/register_request_model.dart';
import 'package:flutter_mental_health/models/register_with_phone_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();
  static var hash = "";

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(AppConfigs.apiUrl, AppConfigs.loginAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(AppConfigs.apiUrl, AppConfigs.registerAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> registerphone(RegisterPhoneRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(AppConfigs.apiUrl, AppConfigs.registerAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Map> otp(OtpRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(AppConfigs.apiUrl, AppConfigs.OtpAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    return jsonDecode(response.body);
  }

  static Future<Map> otpverify(OtpVerifyRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(AppConfigs.apiUrl, AppConfigs.OtpVerifyAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    return jsonDecode(response.body);
  }
}
