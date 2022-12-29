// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentDto _$PostCommentDtoFromJson(Map<String, dynamic> json) =>
    PostCommentDto(
      id: json['id'],
      created: json['created'],
      updated: json['updated'],
      text: json['text'],
      author: json['author'],
      toCommentId: json['toCommentId'],
      like: json['like'],
      dislike: json['dislike'],
      liked: json['liked'],
      answers: json['answers'],
    );

Map<String, dynamic> _$PostCommentDtoToJson(PostCommentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'updated': instance.updated,
      'text': instance.text,
      'author': instance.author,
      'toCommentId': instance.toCommentId,
      'like': instance.like,
      'dislike': instance.dislike,
      'liked': instance.liked,
      'answers': instance.answers,
    };
