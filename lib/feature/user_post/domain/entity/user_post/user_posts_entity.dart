import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_post_entity.dart';

part 'user_posts_entity.freezed.dart';

@freezed
class UserPostsEntity with _$UserPostsEntity {
  const factory UserPostsEntity({
    required int last,
    required int limit,
    required int count,
    required List<UserPostEntity> posts,
  }) = _UserPostsEntity;
}
