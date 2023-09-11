import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/esrb_rating_entity.dart';
import 'package:test_assesment/features/domain/entities/parent_platform_entity.dart';
import '11_esrb_rating_object.dart'; // Import the appropriate entity class

part '12_parent_platform_object.g.dart';

@HiveType(typeId: 12) // Change the typeId if needed
class ParentPlatformObject extends HiveObject {
  @HiveField(0)
  final EsrbRatingObject? platform;

  ParentPlatformObject({
    this.platform,
  });

  factory ParentPlatformObject.fromEntity(ParentPlatformEntity entity) =>
      ParentPlatformObject(
          platform: EsrbRatingObject(
        id: entity.platform?.id,
        name: entity.platform?.name,
        slug: entity.platform?.slug,
      ));

  ParentPlatformEntity toEntity() => ParentPlatformEntity(
      platform: EsrbRatingEntity(
          id: platform?.id, name: platform?.name, slug: platform?.slug));
}
