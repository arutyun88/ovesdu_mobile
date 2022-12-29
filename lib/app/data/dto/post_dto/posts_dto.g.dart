// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPostsDto _$PostsDtoFromJson(Map<String, dynamic> json) => UserPostsDto(
      last: json['last'],
      limit: json['limit'],
      count: json['count'],
      posts: json['posts'],
    );

Map<String, dynamic> _$PostsDtoToJson(UserPostsDto instance) =>
    <String, dynamic>{
      'last': instance.last,
      'limit': instance.limit,
      'count': instance.count,
      'posts': instance.posts,
    };
