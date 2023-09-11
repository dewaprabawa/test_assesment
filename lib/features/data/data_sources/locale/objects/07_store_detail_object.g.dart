// GENERATED CODE - DO NOT MODIFY BY HAND

part of '07_store_detail_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreDetailObjectAdapter extends TypeAdapter<StoreDetailObject> {
  @override
  final int typeId = 7;

  @override
  StoreDetailObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreDetailObject(
      id: fields[0] as int?,
      url: fields[1] as String?,
      developer: fields[2] as DeveloperObject?,
    );
  }

  @override
  void write(BinaryWriter writer, StoreDetailObject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.developer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreDetailObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
