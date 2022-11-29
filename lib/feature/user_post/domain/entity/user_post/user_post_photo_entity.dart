import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_post_photo_entity.freezed.dart';

@freezed
class UserPostPhotoEntity with _$UserPostPhotoEntity {
  const factory UserPostPhotoEntity({
    required int id,
    required DateTime created,
    required String photo,
  }) = _UserPostPhotoEntity;
}
