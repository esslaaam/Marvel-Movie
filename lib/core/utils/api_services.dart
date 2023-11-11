import 'package:dio/dio.dart';
import 'package:movie_app/core/local/app_config.dart';

class ApiServices {

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await Dio().get('${AppConfig.baseUrl}$endPoint');
    return response.data;
  }
}
