import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/author_entity/author_entity.dart';

part 'author_dto.g.dart';

@JsonSerializable()
class AuthorDto {
  final dynamic id;
  final dynamic avatar;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic lastVisit;

  AuthorDto({
    required this.id,
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.lastVisit,
  });

  factory AuthorDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDtoToJson(this);

  AuthorEntity toEntity() => AuthorEntity(
        id: id,
        avatar: avatar,
        firstName: firstName.toString(),
        lastName: lastName.toString(),
        lastVisit: DateTime.parse(lastVisit.toString()).toLocal(),
      );
}
