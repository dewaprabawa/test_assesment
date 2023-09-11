import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/platform_entity.dart';

part '05_platform_object.g.dart';

@HiveType(typeId: 5) // Change the typeId if needed
class PlatformObject extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final dynamic image;
  @HiveField(4)
  final dynamic yearEnd;
  @HiveField(5)
  final int? yearStart;
  @HiveField(6)
  final int? gamesCount;
  @HiveField(7)
  final String? imageBackground;

  PlatformObject({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });

  factory PlatformObject.fromEntity(PlatformEntity entity) =>
      PlatformObject(
        id: entity.id,
        name: entity.name,
        slug: entity.slug,
        image: entity.image,
        yearEnd: entity.yearEnd,
        yearStart: entity.yearStart,
        gamesCount: entity.gamesCount,
        imageBackground: entity.imageBackground,
      );

   PlatformEntity toEntity(){
    return PlatformEntity(
      id: id,
      name: name,
      slug: slug,
      image: image,
      yearEnd: yearEnd,
      yearStart: yearStart,
      gamesCount: gamesCount,
      imageBackground: imageBackground,
    );
   }   
}
