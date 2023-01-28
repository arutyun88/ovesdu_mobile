import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
