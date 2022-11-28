import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_post_author_entity.freezed.dart';

@freezed
class UserPostAuthorEntity with _$UserPostAuthorEntity {
  const factory UserPostAuthorEntity({
    required int id,
    required String firstName,
    required String lastName,
  }) = _UserPostAuthorEntity;
}
