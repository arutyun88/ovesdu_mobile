import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user_post_comment/user_post_comment_entity.dart';
import '../author_dto.dart';

part 'user_post_comment_dto.g.dart';

@JsonSerializable()
class UserPostCommentDto {
  final dynamic id;
  final dynamic created;
  final dynamic updated;
  final dynamic text;
  final dynamic author;
  final dynamic toCommentId;
  final dynamic like;
  final dynamic dislike;
  final dynamic liked;
  final dynamic answers;

  UserPostCommentDto({
    required this.id,
    required this.created,
    required this.updated,
    required this.text,
    required this.author,
    required this.toCommentId,
    required this.like,
    required this.dislike,
    required this.liked,
    required this.answers,
  });

  factory UserPostCommentDto.fromJson(Map<String, dynamic> json) =>
      _$UserPostCommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostCommentDtoToJson(this);

  UserPostCommentEntity toEntity() => UserPostCommentEntity(
        id: id,
        created: DateTime.parse(created.toString()).toLocal(),
        updated: DateTime.parse(updated.toString()).toLocal(),
        text: text,
        author: AuthorDto.fromJson(author).toEntity(),
        toCommentId: toCommentId,
        like: like,
        dislike: dislike,
        liked: liked,
        answers: answers,
      );
}
