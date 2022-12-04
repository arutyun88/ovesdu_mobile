import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_entity.freezed.dart';

@freezed
class AuthorEntity with _$AuthorEntity {
  const factory AuthorEntity({
    required int id,
    required String firstName,
    required String lastName,
    required DateTime lastVisit,
  }) = _AuthorEntity;
}
