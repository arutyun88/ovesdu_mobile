import 'package:freezed_annotation/freezed_annotation.dart';

import '../author_entity/author_entity.dart';
import 'post_photo_entity.dart';
import 'post_video_entity.dart';

part 'post_entity.freezed.dart';

@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    required int id,
    required DateTime created,
    required DateTime updated,
    required String? text,
    required List<PostPhotoEntity> photos,
    required List<PostVideoEntity> videos,
    required int like,
    required int dislike,
    required bool? liked,
    required int comment,
    required AuthorEntity author,
  }) = _PostEntity;
}
