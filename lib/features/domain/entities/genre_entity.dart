import 'package:injectable/injectable.dart';

import 'game_data_entity.dart';

class GenreEntity {
  final int? id;
  final String? name;
  final String? slug;
  final int? gamesCount;
  final String? imageBackground;
  final String? language;

  GenreEntity({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.language,
  });

  factory GenreEntity.fromJson(Map<String, dynamic> json) => GenreEntity(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );
}


extension ToString on List<GenreEntity> {
  String toGenreString() {
    String genreString = "";
    forEach((element) {
      genreString += (element.name ?? '') + ", ";
    });
    return genreString.isNotEmpty
        ? genreString.substring(0, genreString.length - 2)
        : genreString;
  }
  
}
