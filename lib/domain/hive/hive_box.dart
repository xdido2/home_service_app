import 'package:hive_flutter/hive_flutter.dart';
import 'package:home_service_app/domain/hive/hive_key.dart';
import 'package:home_service_app/domain/model/bookings_model.dart';

abstract final class HiveBox{
  static final Box<BookingsModel> bookings = Hive.box(HiveKeys.bookings);
}