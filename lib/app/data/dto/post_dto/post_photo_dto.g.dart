// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostPhotoDto _$PostPhotoDtoFromJson(Map<String, dynamic> json) => PostPhotoDto(
      id: json['id'],
      created: json['created'],
      photo: json['photo'],
    );

Map<String, dynamic> _$PostPhotoDtoToJson(PostPhotoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'photo': instance.photo,
    };
