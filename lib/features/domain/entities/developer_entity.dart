class DeveloperEntity {
  final int? id;
  final String? name;
  final String? slug;
  final int? gamesCount;
  final String? imageBackground;
  final String? domain;
  final String? language;

  DeveloperEntity({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  factory DeveloperEntity.fromJson(Map<String, dynamic> json) =>
      DeveloperEntity(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain: json["domain"],
        language: json["language"],
      );
}


extension ToString on List<DeveloperEntity> {
  String toTagString() {
    String genreString = "";
    forEach((element) {
      genreString += (element.name ?? '') + ", ";
    });
    return genreString.isNotEmpty
        ? genreString.substring(0, genreString.length - 2)
        : genreString;
  }
  
}
