import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/domain/entities/post_entity/posts_entity.dart';
import '../../../domain/entities/post_entity/post_entity.dart';
import 'post_dto.dart';

part 'posts_dto.g.dart';

@JsonSerializable()
class UserPostsDto {
  final dynamic last;
  final dynamic limit;
  final dynamic count;
  final dynamic posts;

  UserPostsDto({
    required this.last,
    required this.limit,
    required this.count,
    required this.posts,
  });

  factory UserPostsDto.fromJson(Map<String, dynamic> json) =>
      _$PostsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostsDtoToJson(this);

  PostsEntity toEntity() => PostsEntity(
        last: last,
        limit: limit,
        count: count,
        posts: _mapUserPost(posts as List),
      );

  List<PostEntity> _mapUserPost(List posts) {
    return posts.map((e) => PostDto.fromJson(e).toEntity()).toList();
  }
}
