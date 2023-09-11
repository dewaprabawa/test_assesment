import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/developer_entity.dart';

part '06_developer_object.g.dart';

@HiveType(typeId: 6) // Change the typeId if needed
class DeveloperObject extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final int? gamesCount;
  @HiveField(4)
  final String? imageBackground;
  @HiveField(5)
  final String? domain;
  @HiveField(6)
  final String? language;

  DeveloperObject({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  factory DeveloperObject.fromEntity(DeveloperEntity entity) =>
      DeveloperObject(
        id: entity.id,
        name: entity.name,
        slug: entity.slug,
        gamesCount: entity.gamesCount,
        imageBackground: entity.imageBackground,
        domain: entity.domain,
        language: entity.language,
      );

    DeveloperEntity toEntity(){
      return DeveloperEntity(
        id: id,
        name: name,
        slug: slug,
        gamesCount: gamesCount,
        imageBackground: imageBackground,
        domain: domain,
        language: language,
      );
    }  
}
