// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCredentials _$RegisterCredentialsFromJson(Map<String, dynamic> json) =>
    RegisterCredentials(
      fullName: json['full_name'] as String,
      birthOfDate: DateTime.parse(json['birth_of_date'] as String),
      phoneNumer: json['phone_numer'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterCredentialsToJson(
        RegisterCredentials instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'birth_of_date': instance.birthOfDate.toIso8601String(),
      'phone_numer': instance.phoneNumer,
      'email': instance.email,
      'password': instance.password,
    };
