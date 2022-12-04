import 'package:freezed_annotation/freezed_annotation.dart';

import '../author_entity.dart';

part 'user_post_comment_entity.freezed.dart';

@freezed
class UserPostCommentEntity with _$UserPostCommentEntity {
  const factory UserPostCommentEntity({
    required int id,
    required DateTime created,
    required DateTime updated,
    required String? text,
    required AuthorEntity author,
    required int? toCommentId,
    required int like,
    required int dislike,
    required bool? liked,
    required int answers,
  }) = _UserPostCommentEntity;
}
