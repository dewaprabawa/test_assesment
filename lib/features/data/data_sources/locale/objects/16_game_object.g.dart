// GENERATED CODE - DO NOT MODIFY BY HAND

part of '16_game_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameObjectAdapter extends TypeAdapter<GameObject> {
  @override
  final int typeId = 16;

  @override
  GameObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameObject(
      id: fields[0] as int?,
      slug: fields[1] as String?,
      name: fields[2] as String?,
      added: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, GameObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.added);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
