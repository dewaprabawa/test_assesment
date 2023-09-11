// GENERATED CODE - DO NOT MODIFY BY HAND

part of '03_rating_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RatingObjectAdapter extends TypeAdapter<RatingObject> {
  @override
  final int typeId = 3;

  @override
  RatingObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatingObject(
      id: fields[0] as int?,
      title: fields[1] as String?,
      count: fields[2] as int?,
      percent: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, RatingObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.percent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
