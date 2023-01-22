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

    if (error is DioError) {
      final locale = error.requestOptions.headers['locale'] ?? 'en';
      try {
        return ErrorEntity(
          message: error.response?.data['message'] ??
              _getLocalizedErrorMessage(locale),
          errorMessage: error.response?.data['error'] ??
              _getLocalizedErrorMessage(locale),
          error: error,
        );
      } catch (_) {
        return ErrorEntity(
          message: _getLocalizedErrorMessage(locale),
        );
      }
    }
    return ErrorEntity(message: _getLocalizedUnknownErrorMessage('en'));
  }

  static String _getLocalizedErrorMessage(String locale) {
    if (locale == 'ru') {
      return 'Ошибка подключения к серверу';
    } else if (locale == 'hy') {
      return 'Սերվերի միացման սխալ';
    } else if (locale == 'fr') {
      return 'Erreur de connexion au serveur';
    } else {
      return 'Server connection error';
    }
  }

  static String _getLocalizedUnknownErrorMessage(String locale) {
    if (locale == 'ru') {
      return 'Неизвестная ошибка';
    } else if (locale == 'hy') {
      return 'Անհայտ սխալ';
    } else if (locale == 'fr') {
      return 'Erreur inconnue';
    } else {
      return 'Unknown error';
    }
  }
}
