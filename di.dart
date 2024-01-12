import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:manipal_enterprise/services/doctor_service.dart';
import 'package:manipal_enterprise/services/notification_service.dart';

import 'firebase_options.dart';

final sl = GetIt.instance;

Future<void> initDep() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([
    PhoneAuthProvider(),
  ]);

  final firebaseAuth = auth.FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final notificationService = NotificationService();
  final doctorService = DoctorService(firestore);

  sl.registerFactory(() => firebaseAuth);

  sl.registerLazySingleton(() => notificationService);
  sl.registerLazySingleton(() => doctorService);

  notificationService.initNotification();
}
