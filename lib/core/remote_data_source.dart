import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_booking_app/extensions/json.dart';

abstract class RemoteDataSource<T extends Object> {
  FirebaseFirestore get firestore;

  Future<T> get(String id);

  Future<List<T>> getAll();

  Future<void> create(Json payload);

  Future<void> update(String id, Json payload);

  Future<void> delete(String id);
}
