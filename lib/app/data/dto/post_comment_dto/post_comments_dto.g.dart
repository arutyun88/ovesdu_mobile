// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comments_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentsDto _$PostCommentsDtoFromJson(Map<String, dynamic> json) =>
    PostCommentsDto(
      last: json['last'],
      limit: json['limit'],
      count: json['count'],
      comments: json['comments'],
      commentsResponses: json['commentsResponses'],
    );

Map<String, dynamic> _$PostCommentsDtoToJson(PostCommentsDto instance) =>
    <String, dynamic>{
      'last': instance.last,
      'limit': instance.limit,
      'count': instance.count,
      'comments': instance.comments,
      'commentsResponses': instance.commentsResponses,
    };
