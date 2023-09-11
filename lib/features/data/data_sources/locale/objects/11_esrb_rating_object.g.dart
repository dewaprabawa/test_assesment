// GENERATED CODE - DO NOT MODIFY BY HAND

part of '11_esrb_rating_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EsrbRatingObjectAdapter extends TypeAdapter<EsrbRatingObject> {
  @override
  final int typeId = 11;

  @override
  EsrbRatingObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EsrbRatingObject(
      id: fields[0] as int?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EsrbRatingObject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EsrbRatingObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
