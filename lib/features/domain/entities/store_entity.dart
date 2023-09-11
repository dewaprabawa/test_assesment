import 'package:test_assesment/features/domain/entities/genre_entity.dart';

class StoreEntity {
  final int? id;
  final GenreEntity? store;

  StoreEntity({
    this.id,
    this.store,
  });

  factory StoreEntity.fromJson(Map<String, dynamic> json) => StoreEntity(
        id: json["id"],
        store: json["store"] == null ? null : GenreEntity.fromJson(json["store"]),
      );
}