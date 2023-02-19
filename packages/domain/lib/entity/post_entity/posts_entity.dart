import 'package:freezed_annotation/freezed_annotation.dart';

import 'post_entity.dart';

part 'posts_entity.freezed.dart';

@freezed
class PostsEntity with _$PostsEntity {
  const factory PostsEntity({
    required int last,
    required int limit,
    required int count,
    required List<PostEntity> posts,
  }) = _PostsEntity;
}
