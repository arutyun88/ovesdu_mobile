import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user_post/user_post_entity.dart';
import '../author_dto.dart';
import 'user_post_photo_dto.dart';
import 'user_post_video_dto.dart';

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
  final dynamic photos;
  final dynamic videos;

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
    required this.photos,
    required this.videos,
  });

  factory UserPostDto.fromJson(Map<String, dynamic> json) =>
      _$UserPostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostDtoToJson(this);

  UserPostEntity toEntity() => UserPostEntity(
        id: id,
        created: DateTime.parse(created.toString()).toLocal(),
        updated: DateTime.parse(updated.toString()).toLocal(),
        text: text,
        photos: (photos as List)
            .map((e) => UserPostPhotoDto.fromJson(e).toEntity())
            .toList(),
        videos: (videos as List)
            .map((e) => UserPostVideoDto.fromJson(e).toEntity())
            .toList(),
        like: like,
        dislike: dislike,
        comment: comment,
        liked: liked,
        author: AuthorDto.fromJson(author).toEntity(),
      );
}
