import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/domain/entities/post_entity/post_video_entity.dart';

part 'post_video_dto.g.dart';

@JsonSerializable()
class PostVideoDto {
  final dynamic id;
  final dynamic created;
  final dynamic video;

  PostVideoDto({
    required this.id,
    required this.created,
    required this.video,
  });

  factory PostVideoDto.fromJson(Map<String, dynamic> json) =>
      _$PostVideoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostVideoDtoToJson(this);

  PostVideoEntity toEntity() => PostVideoEntity(
        id: id,
        created: DateTime.parse(created.toString()).toLocal(),
        video: video.toString(),
      );
}
