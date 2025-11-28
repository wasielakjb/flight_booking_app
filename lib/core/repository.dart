import 'package:flight_booking_app/core/form_request.dart';
import 'package:flight_booking_app/core/remote_data_source.dart';

abstract class Repository<T extends Object> {
  RemoteDataSource get remoteDS;

  Future<T> get(String id);

  Future<List<T>> getAll();

  Future<T> create(String id, covariant FormRequest request);

  Future<T> update(String id, covariant FormRequest request);

  Future<void> delete(String id);
}
