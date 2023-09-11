import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/platform_element_entity.dart';
import 'package:test_assesment/features/domain/entities/platform_entity.dart';
import 'package:test_assesment/features/domain/entities/requirement_entity.dart';

import '05_platform_object.dart';
import '10_requirement_object.dart';

part '09_platform_element_object.g.dart';

@HiveType(typeId: 9) // Change the typeId if needed
class PlatformElementObject extends HiveObject {
  @HiveField(0)
  final PlatformObject? platform;
  @HiveField(1)
  final DateTime? releasedAt;
  @HiveField(2)
  final RequirementsObject? requirementsEn;
  @HiveField(3)
  final RequirementsObject? requirementsRu;

  PlatformElementObject({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
    this.requirementsRu,
  });

  factory PlatformElementObject.fromEntity(PlatformElementEntity entity) =>
      PlatformElementObject(
        platform: PlatformObject(
          id: entity.platform?.id,
          name: entity.platform?.name,
          slug: entity.platform?.slug,
          yearEnd: entity.platform?.yearEnd,
          yearStart: entity.platform?.yearStart,
          gamesCount: entity.platform?.gamesCount,
          image: entity.platform?.image,
          imageBackground: entity.platform?.imageBackground,
        ),
        releasedAt: entity.releasedAt,
        requirementsEn: RequirementsObject(
            minimum: entity.requirementsEn?.minimum,
            recommended: entity.requirementsEn?.recommended),
        requirementsRu: RequirementsObject(
            minimum: entity.requirementsRu?.minimum,
            recommended: entity.requirementsRu?.recommended),
      );

  PlatformElementEntity toEntity() => PlatformElementEntity(
      platform: PlatformEntity(
        id: platform?.id,
        name: platform?.name,
        slug: platform?.slug,
        yearEnd: platform?.yearEnd,
        yearStart: platform?.yearStart,
        gamesCount: platform?.gamesCount,
        image: platform?.image,
        imageBackground: platform?.imageBackground,
      ),
      releasedAt: releasedAt,
      requirementsEn: RequirementsEntity(
        minimum: requirementsEn?.minimum,
        recommended: requirementsRu?.recommended,
      ),
      requirementsRu: RequirementsEntity(
        minimum: requirementsRu?.minimum,
        recommended: requirementsRu?.recommended,
      ));
}
