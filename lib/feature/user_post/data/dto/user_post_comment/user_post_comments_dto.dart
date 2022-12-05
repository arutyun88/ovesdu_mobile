import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user_post_comment/user_post_comment_entity.dart';
import '../../../domain/entity/user_post_comment/user_post_comments_entity.dart';
import 'user_post_comment_dto.dart';

part 'user_post_comments_dto.g.dart';

@JsonSerializable()
class UserPostCommentsDto {
  final dynamic last;
  final dynamic limit;
  final dynamic count;
  final dynamic comments;
  final dynamic commentsResponses;

  UserPostCommentsDto({
    required this.last,
    required this.limit,
    required this.count,
    required this.comments,
    required this.commentsResponses,
  });

  factory UserPostCommentsDto.fromJson(Map<String, dynamic> json) =>
      _$UserPostCommentsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostCommentsDtoToJson(this);

  UserPostCommentsEntity toEntity() => UserPostCommentsEntity(
        last: last,
        limit: limit,
        count: count,
        comments: _mapUserComments(comments as List),
        commentsResponses: _mapUserComments(commentsResponses as List),
      );

  List<UserPostCommentEntity> _mapUserComments(List comments) {
    return comments
        .map((e) => UserPostCommentDto.fromJson(e).toEntity())
        .toList();
  }
}
