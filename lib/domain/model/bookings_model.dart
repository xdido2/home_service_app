import 'package:hive/hive.dart';

part 'bookings_model.g.dart';

@HiveType(typeId: 1)
class BookingsModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int categoryId;
  @HiveField(2)
  final String? date;
  @HiveField(3)
  final String? time;

  const BookingsModel({
    required this.date,
    required this.title,
    required this.categoryId,
    required this.time,
  });
}
