import 'package:test_assesment/features/data/data_sources/remote/models/game_detail_model.dart';
import 'package:test_assesment/features/domain/entities/esrb_rating_entity.dart';
import 'package:test_assesment/features/domain/entities/genre_entity.dart';
import 'package:test_assesment/features/domain/entities/parent_platform_entity.dart';
import 'package:test_assesment/features/domain/entities/platform_element_entity.dart';
import 'package:test_assesment/features/domain/entities/platform_entity.dart';
import 'package:test_assesment/features/domain/entities/rating_entity.dart';
import 'package:test_assesment/features/domain/entities/store_detail_entity.dart';
import 'package:test_assesment/features/domain/entities/store_entity.dart';

import 'developer_entity.dart';

class GameDetailEntity {
  final int? id;
  final String? slug;
  final String? name;
  final String? nameOriginal;
  final String? description;
  final DateTime? released;
  final bool? tba;
  final DateTime? updated;
  final String? backgroundImage;
  final String? backgroundImageAdditional;
  final String? website;
  final double? rating;
  final int? ratingTop;
  final List<RatingEntity>? ratings;
  final Map<String, int>? reactions;
  final String? redditUrl;
  final String? redditName;
  final String? redditDescription;
  final String? redditLogo;
  final List<String>? alternativeNames;
  final String? metacriticUrl;
  final dynamic userGame;
  final List<ParentPlatformEntity>? parentPlatforms;
  final List<PlatformElementEntity>? platforms;
  final List<StoreDetailEntity>? stores;
  final List<DeveloperEntity>? developers;
  final List<DeveloperEntity>? genres;
  final List<DeveloperEntity>? tags;
  final List<DeveloperEntity>? publishers;
  final List<GenreEntity>? tagData;
  final dynamic clip;
  final String? descriptionRaw;

  GameDetailEntity({
    this.id,
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
    this.tagData
  });

  factory GameDetailEntity.fromJson(Map<String, dynamic> json) =>
      GameDetailEntity(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        released:
            json["released"] == null ? null : DateTime.parse(json["released"]),
        tba: json["tba"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        website: json["website"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: json["ratings"] == null
            ? []
            : List<RatingEntity>.from(
                json["ratings"]!.map((x) => RatingEntity.fromJson(x))),
        reactions: Map.from(json["reactions"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
        redditUrl: json["reddit_url"],
        redditName: json["reddit_name"],
        redditDescription: json["reddit_description"],
        redditLogo: json["reddit_logo"],
        alternativeNames: json["alternative_names"] == null
            ? []
            : List<String>.from(json["alternative_names"]!.map((x) => x)),
        metacriticUrl: json["metacritic_url"],
        userGame: json["user_game"],
        parentPlatforms: json["parent_platforms"] == null
            ? []
            : List<ParentPlatformEntity>.from(json["parent_platforms"]!
                .map((x) => ParentPlatformEntity.fromJson(x))),
        platforms: json["platforms"] == null
            ? []
            : List<PlatformElementEntity>.from(json["platforms"]!
                .map((x) => PlatformElementEntity.fromJson(x))),
        stores: json["stores"] == null
            ? []
            : List<StoreDetailEntity>.from(
                json["stores"]!.map((x) => StoreDetailEntity.fromJson(x))),
        developers: json["developers"] == null
            ? []
            : List<DeveloperEntity>.from(
                json["developers"]!.map((x) => DeveloperEntity.fromJson(x))),
        genres: json["genres"] == null
            ? []
            : List<DeveloperEntity>.from(
                json["genres"]!.map((x) => DeveloperEntity.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<DeveloperEntity>.from(
                json["tags"]!.map((x) => DeveloperEntity.fromJson(x))),
        publishers: json["publishers"] == null
            ? []
            : List<DeveloperEntity>.from(
                json["publishers"]!.map((x) => DeveloperEntity.fromJson(x))),
        clip: json["clip"],
        descriptionRaw: json["description_raw"],
        tagData: json["tags"] == null
            ? []
            : List<GenreEntity>.from(json["tags"]!.map((x) => GenreEntity.fromJson(x))),
      );
   

   
  
}


