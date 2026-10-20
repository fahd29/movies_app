
// import your AuthInterceptor path here

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/values/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class ApiModule {
  @singleton
  PrettyDioLogger provideDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
  }

  @singleton
  Dio provideDio(
    PrettyDioLogger logger,
  ) {
    var dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {

        },
      ),
    );

    return dio;
  }
}
