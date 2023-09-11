// GENERATED CODE - DO NOT MODIFY BY HAND

part of '02_genre_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenreObjectAdapter extends TypeAdapter<GenreObject> {
  @override
  final int typeId = 2;

  @override
  GenreObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenreObject(
      id: fields[0] as int?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      gamesCount: fields[3] as int?,
      imageBackground: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GenreObject obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.gamesCount)
      ..writeByte(4)
      ..write(obj.imageBackground);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
