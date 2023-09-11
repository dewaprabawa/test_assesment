import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/rating_entity.dart';

part '03_rating_object.g.dart';

@HiveType(typeId: 3) // Change the typeId if needed
class RatingObject extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final int? count;
  @HiveField(3)
  final double? percent;

  RatingObject({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  factory RatingObject.fromEntity(RatingEntity entity) => RatingObject(
        id: entity.id,
        title: entity.title,
        count: entity.count,
        percent: entity.percent?.toDouble(),
      );

  RatingEntity toEntity() =>
      RatingEntity(id: id, title: title, count: count, percent: percent);
}
