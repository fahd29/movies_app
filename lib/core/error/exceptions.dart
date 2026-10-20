
import 'package:movies_app/config/api_result/api_error_model.dart';

class ServerException implements Exception {
  final ApiErrorModel error;
  ServerException(this.error);

  @override
  String toString() => 'ServerException: ${error.statusMessage}';
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}
