import 'dart:developer';

import 'package:dio/dio.dart';

Duration _connectTimeout = const Duration(seconds: 15);
Duration _receiveTimeout = const Duration(seconds: 15);
Duration _sendTimeout = const Duration(seconds: 10);

abstract class BaseClient {
  Future<Response?> requestNetwork({
    required Method method,
    required String path,
    Object? body,
    Map<String, dynamic>? queryParameters,
  });
}

class BaseRequestImpl implements BaseClient {
  final Dio dio;
  final List<Interceptor>? interceptor;
  final String apiKey = "d3c7d3b0bf514e0f836c1b61dea95161"; 

  BaseRequestImpl(this.dio, {this.interceptor}) {
    final BaseOptions options = BaseOptions(
      baseUrl: "https://api.rawg.io/api/",
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
      responseType: ResponseType.plain,
      validateStatus: (_) {
        return true;
      },
    );
    dio.options.extra['verbose'] = true;
    dio.options = options;
    dio.interceptors.addAll(interceptor ?? []);
  }

  @override
  Future<Response?> requestNetwork(
      {required Method method,
      required String path,
      Object? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      queryParameters?.addAll({"key": apiKey});
      switch (method) {
        case Method.GET:
          return await dio.get(path,
              data: body, queryParameters: queryParameters);
        case Method.POST:
          return await dio.post(path,
              data: body, queryParameters: queryParameters);
        default:
          return await dio.post(path,
              data: body, queryParameters: queryParameters);
      }
      
    } catch (_) {
      rethrow;
    }
  }
}

enum Method { GET, POST, PUT, PATCH, DELETE, HEAD }
