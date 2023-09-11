import 'package:hive/hive.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/02_genre_object.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/game_detail_model.dart';
import 'package:test_assesment/features/domain/entities/developer_entity.dart';
import 'package:test_assesment/features/domain/entities/esrb_rating_entity.dart';
import 'package:test_assesment/features/domain/entities/game_detail_entity.dart';
import 'package:test_assesment/features/domain/entities/genre_entity.dart';
import 'package:test_assesment/features/domain/entities/parent_platform_entity.dart';
import 'package:test_assesment/features/domain/entities/platform_element_entity.dart';
import 'package:test_assesment/features/domain/entities/platform_entity.dart';
import 'package:test_assesment/features/domain/entities/rating_entity.dart';
import 'package:test_assesment/features/domain/entities/store_detail_entity.dart';
import '03_rating_object.dart'; // Import the appropriate entity class
import '09_platform_element_object.dart'; // Import the appropriate entity class
import '12_parent_platform_object.dart'; // Import the appropriate entity class
import '07_store_detail_object.dart'; // Import the appropriate entity class
import '06_developer_object.dart'; // Import the appropriate entity class

part '14_game_detail_object.g.dart';

@HiveType(typeId: 14) // Change the typeId if needed
class GameDetailObject extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? slug;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? nameOriginal;

  @HiveField(4)
  final String? description;

  @HiveField(5)
  final DateTime? released;

  @HiveField(6)
  final bool? tba;

  @HiveField(7)
  final DateTime? updated;

  @HiveField(8)
  final String? backgroundImage;

  @HiveField(9)
  final String? backgroundImageAdditional;

  @HiveField(10)
  final String? website;

  @HiveField(11)
  final double? rating;

  @HiveField(12)
  final int? ratingTop;

  @HiveField(13)
  final List<RatingObject>? ratings;

  @HiveField(14)
  final Map<String, int>? reactions;

  @HiveField(15)
  final String? redditUrl;

  @HiveField(16)
  final String? redditName;

  @HiveField(17)
  final String? redditDescription;

  @HiveField(18)
  final String? redditLogo;

  @HiveField(19)
  final List<String>? alternativeNames;

  @HiveField(20)
  final String? metacriticUrl;

  @HiveField(21)
  final dynamic userGame;

  @HiveField(22)
  final List<ParentPlatformObject>? parentPlatforms;

  @HiveField(23)
  final List<PlatformElementObject>? platforms;

  @HiveField(24)
  final List<StoreDetailObject>? stores;

  @HiveField(25)
  final List<DeveloperObject>? developers;

  @HiveField(26)
  final List<DeveloperObject>? genres;

  @HiveField(27)
  final List<DeveloperObject>? tags;

  @HiveField(28)
  final List<DeveloperObject>? publishers;

  @HiveField(29)
  final dynamic clip;

  @HiveField(30)
  final String? descriptionRaw;

  @HiveField(31)
  final List<GenreObject>? tagData;

  GameDetailObject(
      {this.id,
      this.slug,
      this.name,
      this.nameOriginal,
      this.description,
      this.released,
      this.tba,
      this.updated,
      this.backgroundImage,
      this.backgroundImageAdditional,
      this.website,
      this.rating,
      this.ratingTop,
      this.ratings,
      this.reactions,
      this.redditUrl,
      this.redditName,
      this.redditDescription,
      this.redditLogo,
      this.alternativeNames,
      this.metacriticUrl,
      this.userGame,
      this.parentPlatforms,
      this.platforms,
      this.stores,
      this.developers,
      this.genres,
      this.tags,
      this.publishers,
      this.clip,
      this.descriptionRaw,
      this.tagData});

  factory GameDetailObject.fromEntity(GameDetailEntity entity) =>
      GameDetailObject(
          id: entity.id,
          slug: entity.slug,
          name: entity.name,
          nameOriginal: entity.nameOriginal,
          description: entity.description,
          released: entity.released,
          tba: entity.tba,
          updated: entity.updated,
          backgroundImage: entity.backgroundImage,
          backgroundImageAdditional: entity.backgroundImageAdditional,
          website: entity.website,
          rating: entity.rating,
          ratingTop: entity.ratingTop,
          ratings: entity.ratings
              ?.map((rating) => RatingObject.fromEntity(rating))
              .toList(),
          reactions: entity.reactions,
          redditUrl: entity.redditUrl,
          redditName: entity.redditName,
          redditDescription: entity.redditDescription,
          redditLogo: entity.redditLogo,
          alternativeNames: entity.alternativeNames,
          metacriticUrl: entity.metacriticUrl,
          userGame: entity.userGame,
          parentPlatforms: entity.parentPlatforms
              ?.map((platform) => ParentPlatformObject.fromEntity(platform))
              .toList(),
          platforms: entity.platforms
              ?.map((platform) => PlatformElementObject.fromEntity(platform))
              .toList(),
          stores: entity.stores
              ?.map((store) => StoreDetailObject.fromEntity(store))
              .toList(),
          developers: entity.developers
              ?.map((developer) => DeveloperObject.fromEntity(developer))
              .toList(),
          genres: entity.genres
              ?.map((genre) => DeveloperObject.fromEntity(genre))
              .toList(),
          tags: entity.tags
              ?.map((tag) => DeveloperObject.fromEntity(tag))
              .toList(),
          publishers: entity.publishers
              ?.map((publisher) => DeveloperObject.fromEntity(publisher))
              .toList(),
          clip: entity.clip,
          descriptionRaw: entity.descriptionRaw,
          tagData: entity.tagData
              ?.map((element) => GenreObject(
                  id: element.id,
                  name: element.name,
                  slug: element.slug,
                  imageBackground: element.imageBackground))
              .toList());

  GameDetailEntity toEntity() => GameDetailEntity(
      id: id,
      slug: slug,
      name: name,
      nameOriginal: nameOriginal,
      description: description,
      released: released,
      tba: tba,
      updated: updated,
      backgroundImage: backgroundImage,
      backgroundImageAdditional: backgroundImageAdditional,
      website: website,
      rating: rating,
      ratingTop: ratingTop,
      ratings: ratings?.map((rating) => rating.toEntity()).toList(),
      reactions: reactions,
      redditUrl: redditUrl,
      redditName: redditName,
      redditDescription: redditDescription,
      redditLogo: redditLogo,
      alternativeNames: alternativeNames,
      metacriticUrl: metacriticUrl,
      userGame: userGame,
      parentPlatforms:
          parentPlatforms?.map((platform) => platform.toEntity()).toList(),
      platforms: platforms?.map((platform) => platform.toEntity()).toList(),
      stores: stores?.map((store) => store.toEntity()).toList(),
      developers: developers?.map((developer) => developer.toEntity()).toList(),
      genres: genres?.map((genre) => genre.toEntity()).toList(),
      tags: tags?.map((tag) => tag.toEntity()).toList(),
      publishers: publishers?.map((publisher) => publisher.toEntity()).toList(),
      clip: clip,
      descriptionRaw: descriptionRaw,
      tagData: tagData
          ?.map((element) => GenreEntity(
              id: element.id,
              name: element.name,
              slug: element.slug,
              imageBackground: element.imageBackground))
          .toList());

  GameDetailModel toModel() {
    return GameDetailModel(
        id: id,
        slug: slug,
        name: name,
        nameOriginal: nameOriginal,
        description: description,
        released: released,
        tba: tba,
        updated: updated,
        backgroundImage: backgroundImage,
        backgroundImageAdditional: backgroundImageAdditional,
        website: website,
        rating: rating,
        ratingTop: ratingTop,
        ratings: ratings
            ?.map((element) => RatingEntity(
                id: element.id,
                title: element.title,
                count: element.count,
                percent: element.percent))
            .toList(),
        reactions: reactions,
        redditUrl: redditUrl,
        redditName: redditName,
        redditDescription: redditDescription,
        redditLogo: redditLogo,
        alternativeNames: alternativeNames,
        metacriticUrl: metacriticUrl,
        userGame: userGame,
        parentPlatforms: parentPlatforms
            ?.map((element) => ParentPlatformEntity(
                platform: EsrbRatingEntity(
                    id: element.platform?.id,
                    name: element.platform?.name,
                    slug: element.platform?.slug)))
            .toList(),
        platforms: platforms
            ?.map((element) => PlatformElementEntity(
                platform: PlatformEntity(
                    id: element.platform?.id,
                    name: element.platform?.name,
                    image: element.platform?.image,
                    yearEnd: element.platform?.yearEnd,
                    yearStart: element.platform?.yearStart,
                    slug: element.platform?.slug,
                    gamesCount: element.platform?.gamesCount,
                    imageBackground: element.platform?.imageBackground)))
            .toList(),
        clip: clip,
        descriptionRaw: descriptionRaw,
        tagData: tagData
            ?.map((element) => GenreEntity(
                id: element.id,
                name: element.name,
                slug: element.slug,
                imageBackground: element.imageBackground))
            .toList());
  }
}
