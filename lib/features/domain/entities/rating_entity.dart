

class RatingEntity {
  final int? id;
  final String? title;
  final int? count;
  final double? percent;

  RatingEntity({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  factory RatingEntity.fromJson(Map<String, dynamic> json) => RatingEntity(
        id: json["id"],
        title: json["title"] ?? "-",
        count: json["count"],
        percent: json["percent"]?.toDouble(),
      );
}

