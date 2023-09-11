// GENERATED CODE - DO NOT MODIFY BY HAND

part of '04_short_screen_shot_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShortScreenshotObjectAdapter extends TypeAdapter<ShortScreenshotObject> {
  @override
  final int typeId = 4;

  @override
  ShortScreenshotObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShortScreenshotObject(
      id: fields[0] as int?,
      image: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ShortScreenshotObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortScreenshotObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
