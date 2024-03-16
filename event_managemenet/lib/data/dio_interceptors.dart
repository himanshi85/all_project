import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  Dio dio;

  DioInterceptor({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['token'] = "";
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  void onError(DioException err, ErrorInterceptorHandler handler) async {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      // TODO: Handle this case.
      case DioExceptionType.sendTimeout:
      // TODO: Handle this case.
      case DioExceptionType.receiveTimeout:
      // TODO: Handle this case.
      case DioExceptionType.badCertificate:
      // TODO: Handle this case.
      case DioExceptionType.badResponse:
        {
          switch(err.response?.statusCode){
            case 401:{

            }
          }
        }
      case DioExceptionType.cancel:
      // TODO: Handle this case.
      case DioExceptionType.connectionError:
      // TODO: Handle this case.
      case DioExceptionType.unknown:
      // TODO: Handle this case.
    }
    handler.next(err);
  }
}
