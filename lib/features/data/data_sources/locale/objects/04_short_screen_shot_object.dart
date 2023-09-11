import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/screen_shot_entity.dart';

part '04_short_screen_shot_object.g.dart';

@HiveType(typeId: 4) // Change the typeId if needed
class ShortScreenshotObject extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? image;

  ShortScreenshotObject({
    this.id,
    this.image,
  });

  factory ShortScreenshotObject.fromEntity(ShortScreenshotEntity entity) =>
      ShortScreenshotObject(
        id: entity.id,
        image: entity.image,
      );

  ShortScreenshotEntity toEntity() =>
      ShortScreenshotEntity(id: id, image: image);
}
