import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user_post/user_post_entity.dart';
import 'user_post_author_dto.dart';

part 'user_post_dto.g.dart';

@JsonSerializable()
class UserPostDto {
  final dynamic id;
  final dynamic created;
  final dynamic updated;
  final dynamic text;
  final dynamic like;
  final dynamic dislike;
  final dynamic liked;
  final dynamic comment;
  final dynamic author;

  UserPostDto({
    required this.id,
    required this.created,
    required this.updated,
    required this.text,
    required this.like,
    required this.dislike,
    required this.liked,
    required this.comment,
    required this.author,
  });

  factory UserPostDto.fromJson(Map<String, dynamic> json) =>
      _$UserPostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostDtoToJson(this);

  UserPostEntity toEntity() => UserPostEntity(
        id: id,
        created: DateTime.parse(created.toString()).toLocal(),
        updated: DateTime.parse(updated.toString()).toLocal(),
        text: text,
        like: like,
        dislike: dislike,
        comment: comment,
        liked: liked,
        author: UserPostAuthorDto.fromJson(author).toEntity(),
      );
}
