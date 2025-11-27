import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flight_booking_app/firebase_options.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @preResolve
  @singleton
  Future<FirebaseApp> get firebaseApp =>
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
