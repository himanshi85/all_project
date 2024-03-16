import 'package:dio/dio.dart';

class ApiClient {
  ApiClient._initial();

  ApiClient apiClient = ApiClient._initial();

  Dio dio = createDio();

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: "",
        headers: {
          "Application-json": "",
        },
      ),
    );
    dio.interceptors.addAll({});
    return dio;
  }
}
