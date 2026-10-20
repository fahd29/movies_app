
import 'package:dio/dio.dart';
import 'package:movies_app/config/api_result/api_error_model.dart';
import 'package:movies_app/core/resources/constants_manager.dart';

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  TRANSFORM_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTORISED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  // Local error codes
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
  static const int TRANSFORM_TIMEOUT = -8;
}

class ResponseMessage {
  static const String NO_CONTENT = ApiErrors.noContent;
  static const String BAD_REQUEST = ApiErrors.badRequestError;
  static const String UNAUTORISED = ApiErrors.unauthorizedError;
  static const String FORBIDDEN = ApiErrors.forbiddenError;
  static const String INTERNAL_SERVER_ERROR =
      ApiErrors.internalServerError;
  static const String NOT_FOUND = ApiErrors.notFoundError;

  static const String TIMEOUT = ApiErrors.timeoutError;
  static const String CANCEL = ApiErrors.defaultError;
  static const String CACHE_ERROR = ApiErrors.cacheError;
  static const String NO_INTERNET_CONNECTION =
      ApiErrors.noInternetError;
  static const String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return _failure(
          ResponseCode.NO_CONTENT,
          ResponseMessage.NO_CONTENT,
        );

      case DataSource.BAD_REQUEST:
        return _failure(
          ResponseCode.BAD_REQUEST,
          ResponseMessage.BAD_REQUEST,
        );

      case DataSource.FORBIDDEN:
        return _failure(
          ResponseCode.FORBIDDEN,
          ResponseMessage.FORBIDDEN,
        );

      case DataSource.UNAUTORISED:
        return _failure(
          ResponseCode.UNAUTORISED,
          ResponseMessage.UNAUTORISED,
        );

      case DataSource.NOT_FOUND:
        return _failure(
          ResponseCode.NOT_FOUND,
          ResponseMessage.NOT_FOUND,
        );

      case DataSource.INTERNAL_SERVER_ERROR:
        return _failure(
          ResponseCode.INTERNAL_SERVER_ERROR,
          ResponseMessage.INTERNAL_SERVER_ERROR,
        );

      case DataSource.CONNECT_TIMEOUT:
        return _failure(
          ResponseCode.CONNECT_TIMEOUT,
          ResponseMessage.TIMEOUT,
        );

      case DataSource.TRANSFORM_TIMEOUT:
        return _failure(
          ResponseCode.TRANSFORM_TIMEOUT,
          ResponseMessage.TIMEOUT,
        );

      case DataSource.CANCEL:
        return _failure(
          ResponseCode.CANCEL,
          ResponseMessage.CANCEL,
        );

      case DataSource.RECIEVE_TIMEOUT:
        return _failure(
          ResponseCode.RECIEVE_TIMEOUT,
          ResponseMessage.TIMEOUT,
        );

      case DataSource.SEND_TIMEOUT:
        return _failure(
          ResponseCode.SEND_TIMEOUT,
          ResponseMessage.TIMEOUT,
        );

      case DataSource.CACHE_ERROR:
        return _failure(
          ResponseCode.CACHE_ERROR,
          ResponseMessage.CACHE_ERROR,
        );

      case DataSource.NO_INTERNET_CONNECTION:
        return _failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ResponseMessage.NO_INTERNET_CONNECTION,
        );

      case DataSource.DEFAULT:
        return _failure(
          ResponseCode.DEFAULT,
          ResponseMessage.DEFAULT,
        );
    }
  }
}

ApiErrorModel _failure(int code, String message) {
  return ApiErrorModel(
    success: false,
    statusCode: code,
    statusMessage: message,
  );
}

class ErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    }

    return DataSource.DEFAULT.getFailure();
  }
}

ApiErrorModel _handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();

    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();

    case DioExceptionType.transformTimeout:
      return DataSource.TRANSFORM_TIMEOUT.getFailure();

    case DioExceptionType.badResponse:
      return _parseResponseError(error);

    case DioExceptionType.unknown:
      if (error.response != null) {
        return _parseResponseError(error);
      }
      return DataSource.DEFAULT.getFailure();

    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();

    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
  }
}

ApiErrorModel _parseResponseError(DioException error) {
  final data = error.response?.data;

  if (data is Map) {
    final json = Map<String, dynamic>.from(data);
    final apiError = ApiErrorModel.fromJson(json);

    return ApiErrorModel(
      success: apiError.success ?? false,
      statusCode:
      apiError.statusCode ??
          error.response?.statusCode ??
          ResponseCode.DEFAULT,
      statusMessage:
      apiError.statusMessage ?? ResponseMessage.DEFAULT,
    );
  }

  if (data is String && data.isNotEmpty) {
    return ApiErrorModel(
      success: false,
      statusCode:
      error.response?.statusCode ?? ResponseCode.DEFAULT,
      statusMessage: data,
    );
  }

  return ApiErrorModel(
    success: false,
    statusCode:
    error.response?.statusCode ?? ResponseCode.DEFAULT,
    statusMessage: ResponseMessage.DEFAULT,
  );
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
