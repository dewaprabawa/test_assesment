import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/developer_entity.dart';
import 'package:test_assesment/features/domain/entities/store_detail_entity.dart';

import '06_developer_object.dart';
// Import the DeveloperEntity class

part '07_store_detail_object.g.dart';

@HiveType(typeId: 7) // Change the typeId if needed
class StoreDetailObject extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? url;
  @HiveField(2)
  final DeveloperObject? developer;

  StoreDetailObject({
    this.id,
    this.url,
    this.developer,
  });

  factory StoreDetailObject.fromEntity(StoreDetailEntity entity) =>
      StoreDetailObject(
        id: entity.id,
        url: entity.url,
        developer: DeveloperObject(
          id: entity.store?.id,
          name: entity.store?.name,
          slug: entity.store?.slug,
          gamesCount: entity.store?.gamesCount,
          imageBackground: entity.store?.imageBackground,
          domain: entity.store?.domain,
          language: entity.store?.language
        ),
      );

  StoreDetailEntity toEntity() =>   StoreDetailEntity(id: id, url: url, store: DeveloperEntity(
     id: developer?.id,
          name: developer?.name,
          slug: developer?.slug,
          gamesCount: developer?.gamesCount,
          imageBackground: developer?.imageBackground,
          domain: developer?.domain,
          language: developer?.language
  ));
}
