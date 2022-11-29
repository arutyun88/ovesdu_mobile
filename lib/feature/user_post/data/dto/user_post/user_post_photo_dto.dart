import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user_post/user_post_photo_entity.dart';

part 'user_post_photo_dto.g.dart';

@JsonSerializable()
class UserPostPhotoDto {
  final dynamic id;
  final dynamic created;
  final dynamic photo;

  UserPostPhotoDto({
    required this.id,
    required this.created,
    required this.photo,
  });

  factory UserPostPhotoDto.fromJson(Map<String, dynamic> json) =>
      _$UserPostPhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostPhotoDtoToJson(this);

  UserPostPhotoEntity toEntity() => UserPostPhotoEntity(
        id: id,
        created: DateTime.parse(created.toString()).toLocal(),
        photo: photo.toString(),
      );
}
