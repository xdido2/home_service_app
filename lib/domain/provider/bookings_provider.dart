import 'package:flutter/material.dart';
import 'package:home_service_app/domain/hive/hive_box.dart';
import 'package:home_service_app/domain/model/bookings_model.dart';

class BookingsProvider extends ChangeNotifier {
  void addBooking(BuildContext context, String date, String title, int categoryId, String time) async {
    await HiveBox.bookings.add(BookingsModel(date: date, title: title, categoryId: categoryId, time: time));
  }
}
