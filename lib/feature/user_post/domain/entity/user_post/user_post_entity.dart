import 'package:freezed_annotation/freezed_annotation.dart';

import '../author_entity.dart';
import 'user_post_photo_entity.dart';
import 'user_post_video_entity.dart';

part 'user_post_entity.freezed.dart';

@freezed
class UserPostEntity with _$UserPostEntity {
  const factory UserPostEntity({
    required int id,
    required DateTime created,
    required DateTime updated,
    required String? text,
    required List<UserPostPhotoEntity> photos,
    required List<UserPostVideoEntity> videos,
    required int like,
    required int dislike,
    required bool? liked,
    required int comment,
    required AuthorEntity author,
  }) = _UserPostEntity;
}
