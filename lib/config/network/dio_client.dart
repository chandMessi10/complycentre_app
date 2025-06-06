import 'package:complycentre_app/config/network/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
class DioClient extends _$DioClient {
  final Dio _dio = Dio();
  @override
  Dio build() {
    setBaseUrl();
    _setupInterceptors();
    return _dio;
  }

  void _setupInterceptors() {
    _dio.interceptors.add(DioInterceptor());
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
        ),
      );
    }
  }

  void setBaseUrl() async {
    _dio.options = BaseOptions(
      baseUrl: "",
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {'accept': 'application/json'},
    );
  }
}
