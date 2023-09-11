// GENERATED CODE - DO NOT MODIFY BY HAND

part of '15_creator_data_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreatorDataObjectAdapter extends TypeAdapter<CreatorDataObject> {
  @override
  final int typeId = 15;

  @override
  CreatorDataObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreatorDataObject(
      id: fields[0] as int?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      image: fields[3] as String?,
      imageBackground: fields[4] as String?,
      gamesCount: fields[5] as int?,
      positions: (fields[6] as List?)?.cast<GameObject>(),
      games: (fields[7] as List?)?.cast<GameObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, CreatorDataObject obj) {
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
      ..write(obj.imageBackground)
      ..writeByte(5)
      ..write(obj.gamesCount)
      ..writeByte(6)
      ..write(obj.positions)
      ..writeByte(7)
      ..write(obj.games);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatorDataObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
