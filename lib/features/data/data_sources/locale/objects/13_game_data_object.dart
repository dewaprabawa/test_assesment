import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/esrb_rating_entity.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';
import 'package:test_assesment/features/domain/entities/genre_entity.dart';
import 'package:test_assesment/features/domain/entities/parent_platform_entity.dart';
import 'package:test_assesment/features/domain/entities/rating_entity.dart';
import 'package:test_assesment/features/domain/entities/screen_shot_entity.dart';
import 'package:test_assesment/features/domain/entities/store_entity.dart';

import '01_store_object.dart';
import '02_genre_object.dart';
import '03_rating_object.dart';
import '04_short_screen_shot_object.dart';
import '05_platform_object.dart';
import '11_esrb_rating_object.dart';
import '12_parent_platform_object.dart';

part '13_game_data_object.g.dart';

@HiveType(typeId: 13) // Change the typeId if needed
class GameDataObject extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? slug;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final DateTime? released;

  @HiveField(4)
  final bool? tba;

  @HiveField(5)
  final String? backgroundImage;

  @HiveField(6)
  final double? rating;

  @HiveField(7)
  final int? ratingTop;

  @HiveField(8)
  final List<RatingObject>? ratings;

  @HiveField(9)
  final int? playtime;

  @HiveField(10)
  final DateTime? updated;

  @HiveField(11)
  final dynamic userGame;

  @HiveField(12)
  final List<PlatformObject>? platforms;

  @HiveField(13)
  final List<ParentPlatformObject>? parentPlatforms;

  @HiveField(14)
  final List<GenreObject>? genres;

  @HiveField(15)
  final List<StoreObject>? stores;

  @HiveField(16)
  final dynamic clip;

  @HiveField(17)
  final List<GenreObject>? tags;

  @HiveField(18)
  final List<ShortScreenshotObject>? shortScreenshots;

  GameDataObject({
    this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.playtime,
    this.updated,
    this.userGame,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.stores,
    this.clip,
    this.tags,
    this.shortScreenshots,
  });

  factory GameDataObject.fromEntity(GameData entity) => GameDataObject(
        id: entity.id,
        slug: entity.slug,
        name: entity.name,
        released: entity.released,
        tba: entity.tba,
        backgroundImage: entity.backgroundImage,
        rating: entity.rating,
        ratingTop: entity.ratingTop,
        ratings: entity.ratings
            ?.map((element) => RatingObject(
                id: element.id,
                count: element.count,
                title: element.title,
                percent: element.percent))
            .toList(),
        playtime: entity.playtime,
        updated: entity.updated,
        userGame: entity.userGame,
        parentPlatforms: entity.parentPlatforms
            ?.map((element) => ParentPlatformObject(
                platform: EsrbRatingObject(
                    id: element.platform?.id,
                    name: element.platform?.name,
                    slug: element.platform?.slug)))
            .toList(),
        genres: entity.genres
            ?.map((element) => GenreObject(
                id: element.id,
                name: element.name,
                slug: element.slug,
                gamesCount: element.gamesCount,
                imageBackground: element.imageBackground))
            .toList(),
        stores: entity.stores
            ?.map((element) => StoreObject(
                id: element.id,
                store: GenreObject(
                    id: element.store?.id,
                    name: element.store?.name,
                    slug: element.store?.slug,
                    gamesCount: element.store?.gamesCount,
                    imageBackground: element.store?.imageBackground)))
            .toList(),
        clip: entity.clip,
        tags: entity.genres
            ?.map((element) => GenreObject(
                id: element.id,
                name: element.name,
                slug: element.slug,
                gamesCount: element.gamesCount,
                imageBackground: element.imageBackground))
            .toList(),
        shortScreenshots: entity.shortScreenshots
            ?.map((element) =>
                ShortScreenshotObject(id: element.id, image: element.image))
            .toList(),
      );

  GameData toEntity() {
    return GameData(
      id: id,
      slug: slug,
      name: name,
      released: released,
      tba: tba,
      backgroundImage: backgroundImage,
      rating: rating,
      ratingTop: ratingTop,
      ratings: ratings
          ?.map((element) => RatingEntity(
              id: element.id,
              title: element.title,
              count: element.count,
              percent: element.percent))
          .toList(),
      playtime: playtime,
      updated: updated,
      userGame: userGame,
      parentPlatforms: parentPlatforms
          ?.map((element) => ParentPlatformEntity(
                  platform: EsrbRatingEntity(
                id: element.platform?.id,
                name: element.platform?.name,
                slug: element.platform?.slug,
              )))
          .toList(),
      genres: genres
          ?.map((element) => GenreEntity(
                id: element.id,
                name: element.name,
                slug: element.slug,
                gamesCount: element.gamesCount,
                imageBackground: element.imageBackground,
              ))
          .toList(),
      stores: stores
          ?.map((element) => StoreEntity(
                id: element.id,
                store: GenreEntity(
                  id: element.store?.id,
                  name: element.store?.name,
                  slug: element.store?.slug,
                  gamesCount: element.store?.gamesCount,
                  imageBackground: element.store?.imageBackground,
                ),
              ))
          .toList(),
      clip: clip,
      tags: tags
          ?.map((element) => GenreEntity(
                id: element.id,
                name: element.name,
                slug: element.slug,
                gamesCount: element.gamesCount,
                imageBackground: element.imageBackground,
              ))
          .toList(),
      shortScreenshots: shortScreenshots
          ?.map((element) => ShortScreenshotEntity(
                id: element.id,
                image: element.image,
              ))
          .toList(),
    );
  }
}
