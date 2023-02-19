import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_follower_dto.g.dart';

@JsonSerializable()
class UserProfileFollowerDto {
  final dynamic id;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic image;

  UserProfileFollowerDto({
    this.id,
    this.firstName,
    this.lastName,
    this.image,
  });

  factory UserProfileFollowerDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFollowerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileFollowerDtoToJson(this);

  UserProfileFollowerItemEntity toEntity() => UserProfileFollowerItemEntity(
        id: id.toString(),
        firstName: firstName.toString(),
        lastName: lastName.toString(),
        image: null,
      );
}
