// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookingsModelAdapter extends TypeAdapter<BookingsModel> {
  @override
  final int typeId = 1;

  @override
  BookingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookingsModel(
      date: fields[2] as String?,
      title: fields[0] as String,
      categoryId: fields[1] as int,
      time: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookingsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
