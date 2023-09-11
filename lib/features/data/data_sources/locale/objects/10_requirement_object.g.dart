// GENERATED CODE - DO NOT MODIFY BY HAND

part of '10_requirement_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequirementsObjectAdapter extends TypeAdapter<RequirementsObject> {
  @override
  final int typeId = 10;

  @override
  RequirementsObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RequirementsObject(
      minimum: fields[0] as String?,
      recommended: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RequirementsObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.minimum)
      ..writeByte(1)
      ..write(obj.recommended);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequirementsObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
