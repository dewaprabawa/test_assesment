class PlatformEntity {
  final int? id;
  final String? name;
  final String? slug;
  final dynamic image;
  final dynamic yearEnd;
  final int? yearStart;
  final int? gamesCount;
  final String? imageBackground;

  PlatformEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });

  factory PlatformEntity.fromJson(Map<String, dynamic> json) =>
      PlatformEntity(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );
}

