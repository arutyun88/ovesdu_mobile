import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_dto.g.dart';

@JsonSerializable()
class UserInfoDto {
  final dynamic name;

  UserInfoDto({
    this.name,
  });

  factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoDtoToJson(this);

  @override
  String toString() => name.toString();
}
