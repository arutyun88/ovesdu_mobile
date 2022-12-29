import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/domain/entities/post_entity/post_photo_entity.dart';

part 'post_photo_dto.g.dart';

@JsonSerializable()
class PostPhotoDto {
  final dynamic id;
  final dynamic created;
  final dynamic photo;

  PostPhotoDto({
    required this.id,
    required this.created,
    required this.photo,
  });

  factory PostPhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PostPhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostPhotoDtoToJson(this);

  PostPhotoEntity toEntity() => PostPhotoEntity(
        id: id,
        created: DateTime.parse(created.toString()).toLocal(),
        photo: photo.toString(),
      );
}
