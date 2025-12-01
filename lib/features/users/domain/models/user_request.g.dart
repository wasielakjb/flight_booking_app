// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      fullName: json['full_name'] as String,
      birthOfDate: DateTime.parse(json['birth_of_date'] as String),
      phoneNumer: json['phone_numer'] as String,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'birth_of_date': instance.birthOfDate.toIso8601String(),
      'phone_numer': instance.phoneNumer,
    };
