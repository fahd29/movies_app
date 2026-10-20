
import 'package:dio/dio.dart';
import 'package:movies_app/config/api_result/api_error_handler.dart';
import 'package:movies_app/config/api_result/api_error_model.dart';
import 'package:movies_app/core/error/exceptions.dart';

sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success(T data) = ApiSuccessResult<T>;
  factory ApiResult.error(ApiErrorModel error) = ApiErrorResult<T>;


  static Future<ApiResult<T>> safeApiCall<T>(
    Future<T> Function() apiCall, {
    bool throwOnError = false,
  }) async {
    try {
      final result = await apiCall();

      if (result is Response) {
        final response = result as Response;
        final data = response.data;

        if (response.statusCode == 200 || response.statusCode == 201) {
          if (data is Map<String, dynamic> && data['success'] == false) {
            final error = ApiErrorModel.fromJson(data);
            if (throwOnError) throw ServerException(error);
            return ApiResult.error(error);
          }
          return ApiResult.success(data as T);
        }

        final errorJson = (data is Map<String, dynamic>)
            ? data
            : <String, dynamic>{};
        final error = ApiErrorModel.fromJson(errorJson);
        if (throwOnError) throw ServerException(error);
        return ApiResult.error(error);
      }


      return ApiResult.success(result as T);
    } catch (error) {
      final errorModel = ErrorHandler.handle(error);
      if (throwOnError) throw ServerException(errorModel);
      return ApiResult.error(errorModel);
    }
  }
}

class ApiSuccessResult<T> extends ApiResult<T> {
  final T data;
  ApiSuccessResult(this.data);
}

class ApiErrorResult<T> extends ApiResult<T> {
  final ApiErrorModel error;
  ApiErrorResult(this.error);
}
