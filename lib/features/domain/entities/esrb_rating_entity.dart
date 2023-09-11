class EsrbRatingEntity {
  final int? id;
  final String? name;
  final String? slug;

  EsrbRatingEntity({
    this.id,
    this.name,
    this.slug,
  });

  factory EsrbRatingEntity.fromJson(Map<String, dynamic> json) => EsrbRatingEntity(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );
}
