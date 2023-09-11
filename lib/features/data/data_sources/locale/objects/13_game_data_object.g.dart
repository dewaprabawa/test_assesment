// GENERATED CODE - DO NOT MODIFY BY HAND

part of '13_game_data_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameDataObjectAdapter extends TypeAdapter<GameDataObject> {
  @override
  final int typeId = 13;

  @override
  GameDataObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameDataObject(
      id: fields[0] as int?,
      slug: fields[1] as String?,
      name: fields[2] as String?,
      released: fields[3] as DateTime?,
      tba: fields[4] as bool?,
      backgroundImage: fields[5] as String?,
      rating: fields[6] as double?,
      ratingTop: fields[7] as int?,
      ratings: (fields[8] as List?)?.cast<RatingObject>(),
      playtime: fields[9] as int?,
      updated: fields[10] as DateTime?,
      userGame: fields[11] as dynamic,
      platforms: (fields[12] as List?)?.cast<PlatformObject>(),
      parentPlatforms: (fields[13] as List?)?.cast<ParentPlatformObject>(),
      genres: (fields[14] as List?)?.cast<GenreObject>(),
      stores: (fields[15] as List?)?.cast<StoreObject>(),
      clip: fields[16] as dynamic,
      tags: (fields[17] as List?)?.cast<GenreObject>(),
      shortScreenshots: (fields[18] as List?)?.cast<ShortScreenshotObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, GameDataObject obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.released)
      ..writeByte(4)
      ..write(obj.tba)
      ..writeByte(5)
      ..write(obj.backgroundImage)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.ratingTop)
      ..writeByte(8)
      ..write(obj.ratings)
      ..writeByte(9)
      ..write(obj.playtime)
      ..writeByte(10)
      ..write(obj.updated)
      ..writeByte(11)
      ..write(obj.userGame)
      ..writeByte(12)
      ..write(obj.platforms)
      ..writeByte(13)
      ..write(obj.parentPlatforms)
      ..writeByte(14)
      ..write(obj.genres)
      ..writeByte(15)
      ..write(obj.stores)
      ..writeByte(16)
      ..write(obj.clip)
      ..writeByte(17)
      ..write(obj.tags)
      ..writeByte(18)
      ..write(obj.shortScreenshots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameDataObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
