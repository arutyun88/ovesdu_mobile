import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user_post/user_post_entity.dart';
import '../../../domain/entity/user_post/user_posts_entity.dart';
import 'user_post_dto.dart';

part 'user_posts_dto.g.dart';

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
      _$UserPostsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostsDtoToJson(this);

  UserPostsEntity toEntity() => UserPostsEntity(
        last: last,
        limit: limit,
        count: count,
        posts: _mapUserPost(posts as List),
      );

  List<UserPostEntity> _mapUserPost(List posts) {
    return posts.map((e) => UserPostDto.fromJson(e).toEntity()).toList();
  }
}
