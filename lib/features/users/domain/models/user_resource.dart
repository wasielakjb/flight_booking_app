import 'package:equatable/equatable.dart';

class UserResource extends Equatable {
  const UserResource({
    required this.id,
    required this.fullName,
    required this.email,
    required this.birthOfDate,
    required this.phoneNumer,
  });

  final String id;
  final String fullName;
  final String email;
  final DateTime birthOfDate;
  final String phoneNumer;

  String get letter => fullName[0];

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        birthOfDate,
        phoneNumer,
      ];
}
