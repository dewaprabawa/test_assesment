class ShortScreenshotEntity {
  final int? id;
  final String? image;

  ShortScreenshotEntity({
    this.id,
    this.image,
  });

  factory ShortScreenshotEntity.fromJson(Map<String, dynamic> json) =>
      ShortScreenshotEntity(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
