import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ovesdu_mobile/feature/profile/domain/entities/user_profile/user_profile_entity.dart';

part 'user_profile_dto.g.dart';

@JsonSerializable()
class UserProfileDto {
  final dynamic username;
  final dynamic email;
  final dynamic phoneNumber;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic dateOfBirth;
  final dynamic country;
  final dynamic area;
  final dynamic city;
  final dynamic gender;

  UserProfileDto({
    this.username,
    this.email,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.country,
    this.area,
    this.city,
    this.gender,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);

  UserProfileEntity toEntity() => UserProfileEntity(
        username: username.toString(),
        email: email.toString(),
        phoneNumber: phoneNumber.toString(),
        firstName: firstName.toString(),
        lastName: lastName.toString(),
        dateOfBirth: DateTime.parse(dateOfBirth.toString()),
        country: country.toString(),
        area: area.toString(),
        city: city.toString(),
        isMale: gender.toString() == 'male',
      );
}
