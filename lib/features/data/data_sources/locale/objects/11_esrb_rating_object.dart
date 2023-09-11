import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/esrb_rating_entity.dart';

part '11_esrb_rating_object.g.dart';

@HiveType(typeId: 11) // Change the typeId if needed
class EsrbRatingObject extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;

  EsrbRatingObject({
    this.id,
    this.name,
    this.slug,
  });

  factory EsrbRatingObject.fromEntity(EsrbRatingEntity entity) =>
      EsrbRatingObject(
        id: entity.id,
        name: entity.name,
        slug: entity.slug,
      );

  EsrbRatingEntity toEntity() =>
      EsrbRatingEntity(id: id, slug: slug, name: name);
}
