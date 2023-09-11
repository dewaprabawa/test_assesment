import 'developer_entity.dart';

class StoreDetailEntity {
  final int? id;
  final String? url;
  final DeveloperEntity? store;

  StoreDetailEntity({
    this.id,
    this.url,
    this.store,
  });

  factory StoreDetailEntity.fromJson(Map<String, dynamic> json) =>
      StoreDetailEntity(
        id: json["id"],
        url: json["url"],
        store: json["store"] == null
            ? null
            : DeveloperEntity.fromJson(json["store"]),
      );
}
