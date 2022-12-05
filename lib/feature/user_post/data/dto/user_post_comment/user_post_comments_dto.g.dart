// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post_comments_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPostCommentsDto _$UserPostCommentsDtoFromJson(Map<String, dynamic> json) =>
    UserPostCommentsDto(
      last: json['last'],
      limit: json['limit'],
      count: json['count'],
      comments: json['comments'],
      commentsResponses: json['commentsResponses'],
    );

Map<String, dynamic> _$UserPostCommentsDtoToJson(
        UserPostCommentsDto instance) =>
    <String, dynamic>{
      'last': instance.last,
      'limit': instance.limit,
      'count': instance.count,
      'comments': instance.comments,
      'commentsResponses': instance.commentsResponses,
    };
