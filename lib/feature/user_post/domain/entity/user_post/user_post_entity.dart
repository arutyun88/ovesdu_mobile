import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_post_author_entity.dart';

part 'user_post_entity.freezed.dart';

@freezed
class UserPostEntity with _$UserPostEntity {
  const factory UserPostEntity({
    required int id,
    required DateTime created,
    required DateTime updated,
    required String? text,
    required int like,
    required int dislike,
    required bool? liked,
    required int comment,
    required UserPostAuthorEntity author,
  }) = _UserPostEntity;
}
