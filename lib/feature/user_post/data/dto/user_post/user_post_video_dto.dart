import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user_post/user_post_video_entity.dart';

part 'user_post_video_dto.g.dart';

@JsonSerializable()
class UserPostVideoDto {
  final dynamic id;
  final dynamic created;
  final dynamic video;

  UserPostVideoDto({
    required this.id,
    required this.created,
    required this.video,
  });

  factory UserPostVideoDto.fromJson(Map<String, dynamic> json) =>
      _$UserPostVideoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostVideoDtoToJson(this);

  UserPostVideoEntity toEntity() => UserPostVideoEntity(
        id: id,
        created: DateTime.parse(created.toString()).toLocal(),
        video: video.toString(),
      );
}
