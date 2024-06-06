import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home_service_app/domain/hive/hive_box.dart';
import 'package:home_service_app/domain/hive/hive_key.dart';
import 'package:home_service_app/domain/model/bookings_model.dart';
import 'package:home_service_app/ui/app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookingsModelAdapter());
  await Hive.openBox<BookingsModel>(HiveKeys.bookings);
  print(HiveBox.bookings.length);
  // await HiveBox.bookings.deleteFromDisk();
  // print(HiveBox.bookings.length);

  runApp(const MyApp());
}
