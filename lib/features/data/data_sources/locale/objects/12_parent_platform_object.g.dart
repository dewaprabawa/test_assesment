// GENERATED CODE - DO NOT MODIFY BY HAND

part of '12_parent_platform_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParentPlatformObjectAdapter extends TypeAdapter<ParentPlatformObject> {
  @override
  final int typeId = 12;

  @override
  ParentPlatformObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParentPlatformObject(
      platform: fields[0] as EsrbRatingObject?,
    );
  }

  @override
  void write(BinaryWriter writer, ParentPlatformObject obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.platform);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParentPlatformObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
