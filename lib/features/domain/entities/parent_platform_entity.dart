import 'package:test_assesment/features/domain/entities/esrb_rating_entity.dart';


class ParentPlatformEntity {
  final EsrbRatingEntity? platform;

  ParentPlatformEntity({
    this.platform,
  });

  factory ParentPlatformEntity.fromJson(Map<String, dynamic> json) =>
      ParentPlatformEntity(
        platform: json["platform"] == null
            ? null
            : EsrbRatingEntity.fromJson(json["platform"]),
      );
}
