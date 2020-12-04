import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  onRequest(RequestOptions options) {
    print("ON REQUEST [${options.method}] => PATH: ${options.baseUrl}${options.path}");
    return super.onRequest(options);
  }

  @override
  onResponse(Response response) {
    print("ON RESPONSE [${response.statusCode}] => PATH: ${response.request.path}");
    return super.onResponse(response);
  }

  @override
  onError(DioError error) {
    print("ON ERROR => PATH: ${error.response.data}");
    return super.onError(error);
  }
}
