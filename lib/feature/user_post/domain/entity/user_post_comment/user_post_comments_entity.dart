import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_post_comment_entity.dart';

part 'user_post_comments_entity.freezed.dart';

@freezed
class UserPostCommentsEntity with _$UserPostCommentsEntity {
  const factory UserPostCommentsEntity({
    required int last,
    required int limit,
    required int count,
    required List<UserPostCommentEntity> comments,
  }) = _UserPostCommentsEntity;
}
