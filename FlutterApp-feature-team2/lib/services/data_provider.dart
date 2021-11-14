import 'package:flutter_mental_health/models/example_model.dart';
import 'package:flutter_mental_health/services/data_repository.dart';

class DataProvider {
  static Future<ExampleModel> getSomething() async {
    final response = await DataRepository.getSomething();

    final result = ExampleModel.fromMap(response.data);

    return result;
  }
}
