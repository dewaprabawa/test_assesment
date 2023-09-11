class CreatorEntity {
  final int? count;
  final String? next;
  final String? previous;
  final List<CreatorData>? results;

  CreatorEntity({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory CreatorEntity.fromJson(Map<String, dynamic> json) => CreatorEntity(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<CreatorData>.from(
                json["results"]!.map((x) => CreatorData.fromJson(x))),
      );
}

class CreatorData {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? imageBackground;
  final int? gamesCount;
  final List<Game>? positions;
  final List<Game>? games;

  CreatorData({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.imageBackground,
    this.gamesCount,
    this.positions,
    this.games,
  });

  factory CreatorData.fromJson(Map<String, dynamic> json) => CreatorData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        imageBackground: json["image_background"],
        gamesCount: json["games_count"],
        positions: json["positions"] == null
            ? []
            : List<Game>.from(json["positions"]!.map((x) => Game.fromJson(x))),
        games: json["games"] == null
            ? []
            : List<Game>.from(json["games"]!.map((x) => Game.fromJson(x))),
      );
}

class Game {
  final int? id;
  final String? slug;
  final String? name;
  final int? added;

  Game({
    this.id,
    this.slug,
    this.name,
    this.added,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        added: json["added"],
      );
}
