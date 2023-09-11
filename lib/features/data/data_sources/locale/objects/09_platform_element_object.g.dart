// GENERATED CODE - DO NOT MODIFY BY HAND

part of '09_platform_element_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlatformElementObjectAdapter extends TypeAdapter<PlatformElementObject> {
  @override
  final int typeId = 9;

  @override
  PlatformElementObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlatformElementObject(
      platform: fields[0] as PlatformObject?,
      releasedAt: fields[1] as DateTime?,
      requirementsEn: fields[2] as RequirementsObject?,
      requirementsRu: fields[3] as RequirementsObject?,
    );
  }

  @override
  void write(BinaryWriter writer, PlatformElementObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.platform)
      ..writeByte(1)
      ..write(obj.releasedAt)
      ..writeByte(2)
      ..write(obj.requirementsEn)
      ..writeByte(3)
      ..write(obj.requirementsRu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlatformElementObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
