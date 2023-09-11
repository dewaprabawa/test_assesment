import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/genre_entity.dart';
import 'package:test_assesment/features/domain/entities/store_entity.dart';
import '02_genre_object.dart'; // Import the necessary model class

part '01_store_object.g.dart';

@HiveType(typeId: 1) // Change the typeId if needed
class StoreObject extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final GenreObject? store;

  StoreObject({
    this.id,
    this.store,
  });

  factory StoreObject.fromEntity(StoreEntity entity) => StoreObject(
        id: entity.id,
        store: GenreObject(
          id: entity.store?.id,
          name: entity.store?.name,
          slug: entity.store?.slug,
          gamesCount: entity.store?.gamesCount,
          imageBackground: entity.store?.imageBackground,
        ),
      );

  StoreEntity toEntity() => StoreEntity(
      id: id,
      store: GenreEntity(
          id: store?.id,
          name: store?.name,
          slug: store?.slug,
          gamesCount: store?.gamesCount,
          imageBackground: store?.imageBackground));
}
