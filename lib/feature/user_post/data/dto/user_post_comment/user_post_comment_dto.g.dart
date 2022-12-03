// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post_comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPostCommentDto _$UserPostCommentDtoFromJson(Map<String, dynamic> json) =>
    UserPostCommentDto(
      id: json['id'],
      created: json['created'],
      updated: json['updated'],
      text: json['text'],
      fromUserId: json['fromUserId'],
      toCommentId: json['toCommentId'],
      like: json['like'],
      dislike: json['dislike'],
      liked: json['liked'],
      answers: json['answers'],
    );

Map<String, dynamic> _$UserPostCommentDtoToJson(UserPostCommentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'updated': instance.updated,
      'text': instance.text,
      'fromUserId': instance.fromUserId,
      'toCommentId': instance.toCommentId,
      'like': instance.like,
      'dislike': instance.dislike,
      'liked': instance.liked,
      'answers': instance.answers,
    };
