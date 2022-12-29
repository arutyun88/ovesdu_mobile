import 'package:freezed_annotation/freezed_annotation.dart';

import 'post_comment_entity.dart';

part 'post_comments_entity.freezed.dart';

@freezed
class PostCommentsEntity with _$PostCommentsEntity {
  const factory PostCommentsEntity({
    required int last,
    required int limit,
    required int count,
    required List<PostCommentEntity> comments,
    required List<PostCommentEntity> commentsResponses,
  }) = _PostCommentsEntity;
}
