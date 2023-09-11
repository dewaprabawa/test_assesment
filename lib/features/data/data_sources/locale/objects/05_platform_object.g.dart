// GENERATED CODE - DO NOT MODIFY BY HAND

part of '05_platform_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlatformObjectAdapter extends TypeAdapter<PlatformObject> {
  @override
  final int typeId = 5;

  @override
  PlatformObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlatformObject(
      id: fields[0] as int?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      image: fields[3] as dynamic,
      yearEnd: fields[4] as dynamic,
      yearStart: fields[5] as int?,
      gamesCount: fields[6] as int?,
      imageBackground: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PlatformObject obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.yearEnd)
      ..writeByte(5)
      ..write(obj.yearStart)
      ..writeByte(6)
      ..write(obj.gamesCount)
      ..writeByte(7)
      ..write(obj.imageBackground);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlatformObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
