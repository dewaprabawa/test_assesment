// GENERATED CODE - DO NOT MODIFY BY HAND

part of '06_developer_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeveloperObjectAdapter extends TypeAdapter<DeveloperObject> {
  @override
  final int typeId = 6;

  @override
  DeveloperObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeveloperObject(
      id: fields[0] as int?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      gamesCount: fields[3] as int?,
      imageBackground: fields[4] as String?,
      domain: fields[5] as String?,
      language: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DeveloperObject obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.gamesCount)
      ..writeByte(4)
      ..write(obj.imageBackground)
      ..writeByte(5)
      ..write(obj.domain)
      ..writeByte(6)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeveloperObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
