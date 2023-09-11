import 'package:hive_flutter/hive_flutter.dart';

part '16_game_object.g.dart';

@HiveType(typeId: 16)
class GameObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? slug;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final int? added;

  GameObject({
    this.id,
    this.slug,
    this.name,
    this.added,
  });
}
