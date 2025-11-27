// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCredentials _$RegisterCredentialsFromJson(Map<String, dynamic> json) =>
    RegisterCredentials(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterCredentialsToJson(
        RegisterCredentials instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
    };
