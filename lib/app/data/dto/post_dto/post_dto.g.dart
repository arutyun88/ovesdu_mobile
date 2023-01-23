// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDto _$PostDtoFromJson(Map<String, dynamic> json) => PostDto(
      id: json['id'],
      created: json['created'],
      updated: json['updated'],
      text: json['text'],
      like: json['like'],
      dislike: json['dislike'],
      liked: json['liked'],
      comment: json['comment'],
      author: json['author'],
      photos: json['photos'],
      videos: json['videos'],
    );

Map<String, dynamic> _$PostDtoToJson(PostDto instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'updated': instance.updated,
      'text': instance.text,
      'like': instance.like,
      'dislike': instance.dislike,
      'liked': instance.liked,
      'comment': instance.comment,
      'author': instance.author,
      'photos': instance.photos,
      'videos': instance.videos,
    };
