import 'package:test_assesment/features/domain/entities/creator_entity.dart';

class CreatorModel extends CreatorEntity {
  CreatorModel({
    required int? count,
    required String? next,
    required String? previous,
    required List<CreatorData>? results,
  }):super(count: count, next: next, previous: previous, results: results);

  factory CreatorModel.fromJson(Map<String, dynamic> json) => CreatorModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<CreatorData>.from(
                json["results"]!.map((x) => CreatorData.fromJson(x))),
      );
}
