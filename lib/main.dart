import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home_service_app/domain/hive/hive_key.dart';
import 'package:home_service_app/domain/model/bookings_model.dart';
import 'package:home_service_app/ui/app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookingsModelAdapter());
  await Hive.openBox<BookingsModel>(HiveKeys.bookings);
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyAr1f5MfgHOvlnwxjnbg-CzAf8iPD9Sor0',
        appId: '1:601812662870:android:12ced851e1bb439b4259f7',
        messagingSenderId: '601812662870',
        projectId: 'home-service-app-5b988'),
  );

  runApp(const MyApp());
}
