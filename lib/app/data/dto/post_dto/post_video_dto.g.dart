// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_video_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostVideoDto _$PostVideoDtoFromJson(Map<String, dynamic> json) => PostVideoDto(
      id: json['id'],
      created: json['created'],
      video: json['video'],
    );

Map<String, dynamic> _$PostVideoDtoToJson(PostVideoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'video': instance.video,
    };
