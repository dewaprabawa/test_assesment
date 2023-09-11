import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/16_game_object.dart';
import 'package:test_assesment/features/domain/entities/creator_entity.dart';

part '15_creator_data_object.g.dart';

@HiveType(typeId: 15)
class CreatorDataObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final String? imageBackground;
  @HiveField(5)
  final int? gamesCount;
  @HiveField(6)
  final List<GameObject>? positions;
  @HiveField(7)
  final List<GameObject>? games;

  CreatorDataObject({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.imageBackground,
    this.gamesCount,
    this.positions,
    this.games,
  });

  factory CreatorDataObject.fromEntity(CreatorData entity) {
    return CreatorDataObject(
        id: entity.id,
        name: entity.name,
        slug: entity.slug,
        image: entity.image,
        imageBackground: entity.imageBackground,
        gamesCount: entity.gamesCount,
        games: entity.games
            ?.map((element) => GameObject(
                id: element.id,
                slug: element.slug,
                name: element.name,
                added: element.added))
            .toList(),
        positions: entity.positions
            ?.map((element) => GameObject(
                id: element.id,
                slug: element.slug,
                name: element.name,
                added: element.added))
            .toList());
  }

  CreatorData toEntity() => CreatorData(
      id: id,
      name: name,
      slug: slug,
      gamesCount: gamesCount,
      image: image,
      imageBackground: imageBackground,
      games: games
          ?.map((element) => Game(
              id: element.id,
              slug: element.slug,
              name: element.name,
              added: element.added))
          .toList(),
      positions: positions
          ?.map((element) => Game(
              id: element.id,
              slug: element.slug,
              name: element.name,
              added: element.added))
          .toList());

          
}
