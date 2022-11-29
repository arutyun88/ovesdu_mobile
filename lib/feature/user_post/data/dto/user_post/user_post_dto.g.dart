// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPostDto _$UserPostDtoFromJson(Map<String, dynamic> json) => UserPostDto(
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

Map<String, dynamic> _$UserPostDtoToJson(UserPostDto instance) =>
    <String, dynamic>{
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
