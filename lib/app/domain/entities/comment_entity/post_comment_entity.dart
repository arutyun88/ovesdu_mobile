import 'package:freezed_annotation/freezed_annotation.dart';

import '../author_entity/author_entity.dart';

part 'post_comment_entity.freezed.dart';

@freezed
class PostCommentEntity with _$PostCommentEntity {
  const factory PostCommentEntity({
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
