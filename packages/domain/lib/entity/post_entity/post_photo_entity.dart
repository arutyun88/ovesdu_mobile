import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_photo_entity.freezed.dart';

@freezed
class PostPhotoEntity with _$PostPhotoEntity {
  const factory PostPhotoEntity({
    required int id,
    required DateTime created,
    required String photo,
  }) = _PostPhotoEntity;
}
