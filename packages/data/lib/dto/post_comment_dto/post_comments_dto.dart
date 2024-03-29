import 'package:data/dto/post_comment_dto/post_comment_dto.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_comments_dto.g.dart';

@JsonSerializable()
class PostCommentsDto {
  final dynamic last;
  final dynamic limit;
  final dynamic count;
  final dynamic comments;
  final dynamic commentsResponses;

  PostCommentsDto({
    required this.last,
    required this.limit,
    required this.count,
    required this.comments,
    required this.commentsResponses,
  });

  factory PostCommentsDto.fromJson(Map<String, dynamic> json) =>
      _$PostCommentsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostCommentsDtoToJson(this);

  PostCommentsEntity toEntity() => PostCommentsEntity(
        last: last,
        limit: limit,
        count: count,
        comments: _mapUserComments(comments as List),
        commentsResponses: _mapUserComments(commentsResponses as List),
      );

  List<PostCommentEntity> _mapUserComments(List comments) {
    return comments.map((e) => PostCommentDto.fromJson(e).toEntity()).toList();
  }
}
