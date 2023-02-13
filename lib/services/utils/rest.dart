import 'package:dio/dio.dart' as dio;

import '../response/response.dart';
import 'storage.dart';
import 'logger.dart';

class Rest {
  late dio.Dio client;
  final Function? fnModifier;

  Rest(this.fnModifier) {
    const String baseUrl = String.fromEnvironment(
      'NVO_BASEURL',
      defaultValue: 'https://api.envio.co.id/v1/',
    );

    client = dio.Dio(dio.BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        contentType: "application/json"));

    client.interceptors.add(loggerInterceptor);
  }

  Future<ServiceResponse> _request(
      String path, String method, dynamic payload) async {
    try {
      var token = await SessionToken.read();

      client.options.method = method;
      client.options.headers = {
        "Accept": "application/json",
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      };

      var response = await client.request(
        path,
        data: (method != "GET") ? payload : null,
        queryParameters: (method == "GET") ? payload : null,
      );

      return ServiceResponse.fromJson(false, fnModifier, response.data);
    } on dio.DioError catch (error) {
      if (error.type == dio.DioErrorType.response) {
        return ServiceResponse.fromJson(true, null, error.response?.data);
      } else {
        return ServiceResponse(message: error.message, isError: true);
      }
    } catch (e) {
      return ServiceResponse(message: "Another Error", isError: true);
    }
  }

  Future<ServiceResponse> get(String path, dynamic query) async {
    return _request(path, "GET", query);
  }

  Future<ServiceResponse> post(String path, dynamic payload) async {
    return _request(path, "POST", payload);
  }

  Future<ServiceResponse> put(String path, dynamic payload) async {
    return _request(path, "PUT", payload);
  }

  Future<ServiceResponse> delete(String path, dynamic query) async {
    return _request(path, "DELETE", query);
  }
}
