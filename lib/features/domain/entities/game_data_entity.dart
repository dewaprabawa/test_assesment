
import 'package:test_assesment/features/domain/entities/platform_element_entity.dart';
import 'package:test_assesment/features/domain/entities/rating_entity.dart';
import 'package:test_assesment/features/domain/entities/screen_shot_entity.dart';
import 'package:test_assesment/features/domain/entities/store_entity.dart';

import 'genre_entity.dart';
import 'parent_platform_entity.dart';

class GameEntity {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<GameData>? results;

  GameEntity({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory GameEntity.fromJson(Map<String, dynamic> json) => GameEntity(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<GameData>.from(
                json["results"]!.map((x) => GameData.fromJson(x))),
      );
}

class GameData {
  final int? id;
  final String? slug;
  final String? name;
  final DateTime? released;
  final bool? tba;
  final String? backgroundImage;
  final double? rating;
  final int? ratingTop;
  final List<RatingEntity>? ratings;
  final int? playtime;
  final DateTime? updated;
  final dynamic userGame;
  final List<PlatformElementEntity>? platforms;
  final List<ParentPlatformEntity>? parentPlatforms;
  final List<GenreEntity>? genres;
  final List<StoreEntity>? stores;
  final dynamic clip;
  final List<GenreEntity>? tags;
  final List<ShortScreenshotEntity>? shortScreenshots;

  GameData({
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

  factory GameData.fromJson(Map<String, dynamic> json) => GameData(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        released:
            json["released"] == null ? null : DateTime.parse(json["released"]),
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: json["ratings"] == null
            ? []
            : List<RatingEntity>.from(
                json["ratings"]!.map((x) => RatingEntity.fromJson(x))),
        playtime: json["playtime"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        userGame: json["user_game"],
        platforms: json["platforms"] == null
            ? []
            : List<PlatformElementEntity>.from(
                json["platforms"]!.map((x) => PlatformElementEntity.fromJson(x))),
        parentPlatforms: json["parent_platforms"] == null
            ? []
            : List<ParentPlatformEntity>.from(json["parent_platforms"]!
                .map((x) => ParentPlatformEntity.fromJson(x))),
        genres: json["genres"] == null
            ? []
            : List<GenreEntity>.from(json["genres"]!.map((x) => GenreEntity.fromJson(x))),
        stores: json["stores"] == null
            ? []
            : List<StoreEntity>.from(json["stores"]!.map((x) => StoreEntity.fromJson(x))),
        clip: json["clip"],
        tags: json["tags"] == null
            ? []
            : List<GenreEntity>.from(json["tags"]!.map((x) => GenreEntity.fromJson(x))),
        shortScreenshots: json["short_screenshots"] == null
            ? []
            : List<ShortScreenshotEntity>.from(json["short_screenshots"]!
                .map((x) => ShortScreenshotEntity.fromJson(x))),
      );
}




