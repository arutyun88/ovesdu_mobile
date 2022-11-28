// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_posts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPostsDto _$UserPostsDtoFromJson(Map<String, dynamic> json) => UserPostsDto(
      last: json['last'],
      limit: json['limit'],
      count: json['count'],
      posts: json['posts'],
    );

Map<String, dynamic> _$UserPostsDtoToJson(UserPostsDto instance) =>
    <String, dynamic>{
      'last': instance.last,
      'limit': instance.limit,
      'count': instance.count,
      'posts': instance.posts,
    };
