import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_entity.freezed.dart';

part 'error_entity.g.dart';

@freezed
class ErrorEntity with _$ErrorEntity {
  const factory ErrorEntity({
    required String message,
    String? errorMessage,
    dynamic error,
  }) = _ErrorEntity;

  factory ErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorEntityFromJson(json);

  factory ErrorEntity.fromException(dynamic error) {
    if (error is ErrorEntity) return error;

    const entity = ErrorEntity(message: 'Unknown error');
    if (error is DioError) {
      try {
        return ErrorEntity(
          message: error.response?.data['message'] ?? 'Unknown error',
          errorMessage: error.response?.data['error'] ?? 'Unknown error',
          error: error,
        );
      } catch (_) {
        return entity;
      }
    }
    return entity;
  }
}
