import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/genre_entity.dart';

part '02_genre_object.g.dart';

@HiveType(typeId: 2) // Change the typeId if needed
class GenreObject extends HiveObject {
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

  GenreObject({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
  });

  factory GenreObject.fromEntity(GenreEntity entity) => GenreObject(
        id: entity.id,
        name: entity.name,
        slug: entity.slug,
        gamesCount: entity.gamesCount,
        imageBackground: entity.imageBackground,
      );

  GenreEntity toEntity() => GenreEntity(
      id: id,
      name: name,
      slug: slug,
      gamesCount: gamesCount,
      imageBackground: imageBackground);
}
