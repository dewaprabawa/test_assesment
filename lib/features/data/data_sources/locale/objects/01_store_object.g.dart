// GENERATED CODE - DO NOT MODIFY BY HAND

part of '01_store_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreObjectAdapter extends TypeAdapter<StoreObject> {
  @override
  final int typeId = 1;

  @override
  StoreObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreObject(
      id: fields[0] as int?,
      store: fields[1] as GenreObject?,
    );
  }

  @override
  void write(BinaryWriter writer, StoreObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.store);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
