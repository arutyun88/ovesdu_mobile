// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      phoneCountryCode: json['phoneCountryCode'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: json['dateOfBirth'],
      locationId: json['locationId'],
      deviceList: (json['deviceList'] as List<dynamic>?)
          ?.map((e) => DeviceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      gender: json['gender'],
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'phoneCountryCode': instance.phoneCountryCode,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'locationId': instance.locationId,
      'deviceList': instance.deviceList,
      'gender': instance.gender,
    };
