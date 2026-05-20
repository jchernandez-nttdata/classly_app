import 'dart:async';
import 'dart:io' as io;

import 'package:classly_app/core/network/http_client.dart';
import 'package:classly_app/core/network/http_request.dart';
import 'package:dio/dio.dart';

class DioHttpClient implements IHttpClient {
  DioHttpClient(this._dio);
  final Dio _dio;
  @override
  Future<HttpResponse<dynamic>> request(
    HttpRequest request,
  ) async {
    try {
      /// we ignore the inference failure here because Dio's request method is
      /// not generic, but we want to parse the data regardless of its type
      // ignore: inference_failure_on_function_invocation
      final response = await _dio.request(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          method: request.method.name.toUpperCase(),
          headers: {
            io.HttpHeaders.contentTypeHeader: 'application/json',
          },
          validateStatus: (status) {
            return status != null && status >= 200 && status < 300;
          },
        ),
      );

      return HttpResponse<dynamic>(
        data: response.data,
        statusCode: response.statusCode ?? 0,
        headers: response.headers.map,
      );
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
