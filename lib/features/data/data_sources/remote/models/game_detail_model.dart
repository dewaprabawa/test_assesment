import 'package:test_assesment/features/domain/entities/developer_entity.dart';
import 'package:test_assesment/features/domain/entities/game_detail_entity.dart';
import 'package:test_assesment/features/domain/entities/genre_entity.dart';
import 'package:test_assesment/features/domain/entities/parent_platform_entity.dart';
import 'package:test_assesment/features/domain/entities/platform_element_entity.dart';
import 'package:test_assesment/features/domain/entities/rating_entity.dart';
import 'package:test_assesment/features/domain/entities/store_detail_entity.dart';

class GameDetailModel extends GameDetailEntity {
  GameDetailModel({
    int? id,
    String? slug,
    String? name,
    String? nameOriginal,
    String? description,
    DateTime? released,
    bool? tba,
    DateTime? updated,
    String? backgroundImage,
    String? backgroundImageAdditional,
    String? website,
    double? rating,
    int? ratingTop,
    List<RatingEntity>? ratings,
    Map<String, int>? reactions,
    String? redditUrl,
    String? redditName,
    String? redditDescription,
    String? redditLogo,
    List<String>? alternativeNames,
    String? metacriticUrl,
    dynamic userGame,
    List<ParentPlatformEntity>? parentPlatforms,
    List<PlatformElementEntity>? platforms,
    List<StoreDetailEntity>? stores,
    List<DeveloperEntity>? developers,
    List<DeveloperEntity>? genres,
    List<DeveloperEntity>? tags,
    List<DeveloperEntity>? publishers,
    dynamic clip,
    String? descriptionRaw,
    List<GenreEntity>? tagData,
  }) : super(
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
          rating: rating?.toDouble(),
          ratingTop: ratingTop,
          ratings: ratings,
          reactions: reactions,
          redditUrl: redditUrl,
          redditName: redditName,
          redditDescription: redditDescription,
          redditLogo: redditLogo,
          alternativeNames: alternativeNames,
          platforms: platforms,
        );

  factory GameDetailModel.fromJson(Map<String, dynamic> json) {
    return GameDetailModel(
      id: json["id"],
      slug: json["slug"],
      name: json["name"],
      nameOriginal: json["name_original"],
      description: json["description"],
      released:
          json["released"] == null ? null : DateTime.parse(json["released"]),
      tba: json["tba"],
      updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
      backgroundImage: json["background_image"],
      backgroundImageAdditional: json["background_image_additional"],
      website: json["website"],
      rating: json["rating"] as double,
      ratingTop: json["rating_top"],
      reactions: json["reactions"] == null
          ? null
          : Map<String, int>.from(json["reactions"]),
      redditUrl: json["reddit_url"],
      redditName: json["reddit_name"],
      redditDescription: json["reddit_description"],
      redditLogo: json["reddit_logo"],
      alternativeNames: json["alternative_names"] == null
          ? []
          : List<String>.from(json["alternative_names"]!.map((x) => x)),
      platforms: json["platforms"] == null
          ? []
          : List<PlatformElementEntity>.from(
              json["platforms"]!.map((x) => PlatformElementEntity.fromJson(x))),
    );
  }

}
