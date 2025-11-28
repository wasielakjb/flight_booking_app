import 'package:flight_booking_app/core/repository.dart';
import 'package:flight_booking_app/features/users/data/data_sources/user_remote_ds.dart';
import 'package:flight_booking_app/features/users/data/mapper/user_mapper.dart';
import 'package:flight_booking_app/features/users/domain/models/user_request.dart';
import 'package:flight_booking_app/features/users/domain/models/user_resource.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserRepository extends Repository<UserResource> {
  UserRepository({required this.remoteDS});

  @override
  @protected
  final UserRemoteDataSource remoteDS;

  @override
  Future<UserResource> get(String id) async {
    return remoteDS.get(id).then((value) => value.asEntity());
  }

  @override
  Future<List<UserResource>> getAll() async {
    return remoteDS
        .getAll()
        .then((value) => value.map((e) => e.asEntity()).toList());
  }

  @override
  Future<UserResource> create(String id, UserRequest request) async {
    return remoteDS.create(id, request.toJson()).then((res) => res.asEntity());
  }

  @override
  Future<UserResource> update(String id, UserRequest request) async {
    return remoteDS.update(id, request.toJson()).then((res) => res.asEntity());
  }

  @override
  Future<void> delete(String id) {
    return remoteDS.delete(id);
  }
}
