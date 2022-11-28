import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user_post/user_post_author_entity.dart';

part 'user_post_author_dto.g.dart';

@JsonSerializable()
class UserPostAuthorDto {
  final dynamic id;
  final dynamic firstName;
  final dynamic lastName;

  UserPostAuthorDto({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory UserPostAuthorDto.fromJson(Map<String, dynamic> json) =>
      _$UserPostAuthorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostAuthorDtoToJson(this);

  UserPostAuthorEntity toEntity() => UserPostAuthorEntity(
        id: id,
        firstName: firstName.toString(),
        lastName: lastName.toString(),
      );
}
