// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCredentials _$RegisterCredentialsFromJson(Map<String, dynamic> json) =>
    RegisterCredentials(
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      birthOfDate: json['birth_of_date'] as String,
      phoneNumer: json['phone_numer'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterCredentialsToJson(
        RegisterCredentials instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
      'birth_of_date': instance.birthOfDate,
      'phone_numer': instance.phoneNumer,
      'password': instance.password,
    };
