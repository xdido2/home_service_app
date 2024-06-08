import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BookingsProvider extends ChangeNotifier {
  late FirebaseDatabase database;
  late DatabaseReference ref;

  BookingsProvider() {
    initializeDatabase();
  }

  void initializeDatabase() {
    database = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://home-service-app-5b988-default-rtdb.asia-southeast1.firebasedatabase.app/',
    );
    ref = database.ref('Bookings');
  }

  void addBooking(
    BuildContext context,
    String date,
    String title,
    int categoryId,
    String time,
  ) async {
    String id = DateTime.now().microsecond.toString();

    await ref.child(id).set({
      'time': time,
      'date': date,
      'categoryId': categoryId,
      'title': title,
      'id': id,
    });
  }


}
