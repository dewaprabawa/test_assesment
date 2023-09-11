
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';

class GameModel extends GameEntity {
  GameModel({
    required int? count,
    required String? next,
    required String? previous,
    required List<GameData>? results,
  }) : super(count: count, next: next, previous: previous, results: results);
  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<GameData>.from(
                json["results"]!.map((x) => GameData.fromJson(x))),
      );
}
