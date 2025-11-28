import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_booking_app/core/remote_data_source.dart';
import 'package:flight_booking_app/extensions/json.dart';
import 'package:flight_booking_app/features/users/data/network/network_user.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserRemoteDataSource extends RemoteDataSource<NetworkUser> {
  UserRemoteDataSource(this.firestore);

  @override
  @protected
  final FirebaseFirestore firestore;

  @protected
  CollectionReference<Json> get collection => firestore.collection('users');

  @override
  Future<NetworkUser> create(Json payload) async {
    final id = payload['id'] as String;
    await collection.doc(id).set(payload);
    return get(id);
  }

  @override
  Future<void> delete(String id) async {
    await collection.doc(id).delete();
  }

  @override
  Future<NetworkUser> get(String id) async {
    final doc = await collection.doc(id).get();
    return NetworkUser.fromJson(doc.data()!);
  }

  @override
  Future<List<NetworkUser>> getAll() async {
    final snapshot = await collection.get();
    return snapshot.docs
        .map((doc) => NetworkUser.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<NetworkUser> update(String id, Json payload) async {
    await collection.doc(id).update(payload);
    return get(id);
  }
}
