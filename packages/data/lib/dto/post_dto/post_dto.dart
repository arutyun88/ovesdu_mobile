import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../author_dto/author_dto.dart';
import 'post_photo_dto.dart';
import 'post_video_dto.dart';

part 'post_dto.g.dart';

@JsonSerializable()
class PostDto {
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

  PostDto({
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

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDtoToJson(this);

  PostEntity toEntity() => PostEntity(
        id: id,
        created: DateTime.parse(created.toString()).toLocal(),
        updated: DateTime.parse(updated.toString()).toLocal(),
        text: text,
        photos: (photos as List)
            .map((e) => PostPhotoDto.fromJson(e).toEntity())
            .toList(),
        videos: (videos as List)
            .map((e) => PostVideoDto.fromJson(e).toEntity())
            .toList(),
        like: like,
        dislike: dislike,
        comment: comment,
        liked: liked,
        author: AuthorDto.fromJson(author).toEntity(),
      );
}
