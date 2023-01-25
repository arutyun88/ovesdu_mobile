import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_profile_statistic_dto.g.dart';

@JsonSerializable()
class UserProfileStatisticDto {
  final dynamic trust;
  final dynamic coins;
  final dynamic followers;
  final dynamic following;

  UserProfileStatisticDto({
    this.trust,
    this.coins,
    this.followers,
    this.following,
  });

  factory UserProfileStatisticDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileStatisticDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileStatisticDtoToJson(this);

  UserProfileStatisticEntity toEntity() => UserProfileStatisticEntity(
        trust: trust.toString(),
        coins: coins.toString(),
        followers: (followers as List).map((e) => e as int).toList(),
        following: (following as List).map((e) => e as int).toList(),
      );
}
