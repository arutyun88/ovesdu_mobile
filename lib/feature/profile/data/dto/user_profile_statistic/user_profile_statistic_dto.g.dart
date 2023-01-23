// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_statistic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileStatisticDto _$UserProfileStatisticDtoFromJson(
        Map<String, dynamic> json) =>
    UserProfileStatisticDto(
      trust: json['trust'],
      coins: json['coins'],
      followers: json['followers'],
      following: json['following'],
    );

Map<String, dynamic> _$UserProfileStatisticDtoToJson(
        UserProfileStatisticDto instance) =>
    <String, dynamic>{
      'trust': instance.trust,
      'coins': instance.coins,
      'followers': instance.followers,
      'following': instance.following,
    };
