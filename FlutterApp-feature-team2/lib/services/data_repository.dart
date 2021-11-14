import 'package:dio/dio.dart';
import 'package:flutter_mental_health/configs/app_config.dart';
import 'package:flutter_mental_health/constants/endpoints.dart';

/**
 * Example Repository
 */
class DataRepository {
  static const baseUrl = AppConfigs.apiUrl;
  static Future<Response> getSomething() async {
    Dio _dio = Dio();
    Response response =
        await _dio.get("$baseUrl${AppEndpoint.exampleEndpoint}");
    return response;
  }
}
