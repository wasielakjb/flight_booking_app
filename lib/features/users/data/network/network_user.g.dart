// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkUser _$NetworkUserFromJson(Map<String, dynamic> json) => NetworkUser(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      birthOfDate: json['birth_of_date'] as String,
      phoneNumer: json['phone_numer'] as String,
    );

Map<String, dynamic> _$NetworkUserToJson(NetworkUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'birth_of_date': instance.birthOfDate,
      'phone_numer': instance.phoneNumer,
    };
