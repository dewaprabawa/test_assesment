// GENERATED CODE - DO NOT MODIFY BY HAND

part of '14_game_detail_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameDetailObjectAdapter extends TypeAdapter<GameDetailObject> {
  @override
  final int typeId = 14;

  @override
  GameDetailObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameDetailObject(
      id: fields[0] as int?,
      slug: fields[1] as String?,
      name: fields[2] as String?,
      nameOriginal: fields[3] as String?,
      description: fields[4] as String?,
      released: fields[5] as DateTime?,
      tba: fields[6] as bool?,
      updated: fields[7] as DateTime?,
      backgroundImage: fields[8] as String?,
      backgroundImageAdditional: fields[9] as String?,
      website: fields[10] as String?,
      rating: fields[11] as double?,
      ratingTop: fields[12] as int?,
      ratings: (fields[13] as List?)?.cast<RatingObject>(),
      reactions: (fields[14] as Map?)?.cast<String, int>(),
      redditUrl: fields[15] as String?,
      redditName: fields[16] as String?,
      redditDescription: fields[17] as String?,
      redditLogo: fields[18] as String?,
      alternativeNames: (fields[19] as List?)?.cast<String>(),
      metacriticUrl: fields[20] as String?,
      userGame: fields[21] as dynamic,
      parentPlatforms: (fields[22] as List?)?.cast<ParentPlatformObject>(),
      platforms: (fields[23] as List?)?.cast<PlatformElementObject>(),
      stores: (fields[24] as List?)?.cast<StoreDetailObject>(),
      developers: (fields[25] as List?)?.cast<DeveloperObject>(),
      genres: (fields[26] as List?)?.cast<DeveloperObject>(),
      tags: (fields[27] as List?)?.cast<DeveloperObject>(),
      publishers: (fields[28] as List?)?.cast<DeveloperObject>(),
      clip: fields[29] as dynamic,
      descriptionRaw: fields[30] as String?,
      tagData: (fields[31] as List?)?.cast<GenreObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, GameDetailObject obj) {
    writer
      ..writeByte(32)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.nameOriginal)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.released)
      ..writeByte(6)
      ..write(obj.tba)
      ..writeByte(7)
      ..write(obj.updated)
      ..writeByte(8)
      ..write(obj.backgroundImage)
      ..writeByte(9)
      ..write(obj.backgroundImageAdditional)
      ..writeByte(10)
      ..write(obj.website)
      ..writeByte(11)
      ..write(obj.rating)
      ..writeByte(12)
      ..write(obj.ratingTop)
      ..writeByte(13)
      ..write(obj.ratings)
      ..writeByte(14)
      ..write(obj.reactions)
      ..writeByte(15)
      ..write(obj.redditUrl)
      ..writeByte(16)
      ..write(obj.redditName)
      ..writeByte(17)
      ..write(obj.redditDescription)
      ..writeByte(18)
      ..write(obj.redditLogo)
      ..writeByte(19)
      ..write(obj.alternativeNames)
      ..writeByte(20)
      ..write(obj.metacriticUrl)
      ..writeByte(21)
      ..write(obj.userGame)
      ..writeByte(22)
      ..write(obj.parentPlatforms)
      ..writeByte(23)
      ..write(obj.platforms)
      ..writeByte(24)
      ..write(obj.stores)
      ..writeByte(25)
      ..write(obj.developers)
      ..writeByte(26)
      ..write(obj.genres)
      ..writeByte(27)
      ..write(obj.tags)
      ..writeByte(28)
      ..write(obj.publishers)
      ..writeByte(29)
      ..write(obj.clip)
      ..writeByte(30)
      ..write(obj.descriptionRaw)
      ..writeByte(31)
      ..write(obj.tagData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameDetailObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
