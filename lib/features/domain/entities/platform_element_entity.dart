import 'package:test_assesment/features/domain/entities/requirement_entity.dart';
import 'platform_entity.dart';

class PlatformElementEntity {
  final PlatformEntity? platform;
  final DateTime? releasedAt;
  final RequirementsEntity? requirementsEn;
  final RequirementsEntity? requirementsRu;

  PlatformElementEntity({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
    this.requirementsRu,
  });

  factory PlatformElementEntity.fromJson(Map<String, dynamic> json) =>
      PlatformElementEntity(
        platform: json["platform"] == null
            ? null
            : PlatformEntity.fromJson(json["platform"]),
        releasedAt: json["released_at"] == null
            ? null
            : DateTime.parse(json["released_at"]),
        requirementsEn: json["requirements_en"] == null
            ? null
            : RequirementsEntity.fromJson(json["requirements_en"]),
        requirementsRu: json["requirements_ru"] == null
            ? null
            : RequirementsEntity.fromJson(json["requirements_ru"]),
      );
}

