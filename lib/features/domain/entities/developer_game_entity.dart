
import 'package:test_assesment/features/domain/entities/creator_entity.dart';

class DeveloperDataEntity{
  final int? count;
  final String? next;
  final String? previous;
  final List<DeveloperData>? results;

  DeveloperDataEntity({this.count, this.next, this.previous, this.results});
}

class DeveloperData {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? imageBackground;
  final String? description;
  final int? gamesCount;
  final List<Game>? games;

  DeveloperData({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.imageBackground,
    this.gamesCount,
    this.games,
    this.description,
  });

  factory DeveloperData.fromJson(Map<String, dynamic> json) => DeveloperData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        imageBackground: json["image_background"],
        gamesCount: json["games_count"],
        games: json["games"] == null
            ? []
            : List<Game>.from(json["games"]!.map((x) => Game.fromJson(x))),
            description: json["description"] ?? "",
      );
}
