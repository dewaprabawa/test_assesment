import 'package:test_assesment/features/domain/entities/developer_game_entity.dart';

class DeveloperDataModel extends DeveloperDataEntity {
  final int? count;
  final String? next;
  final String? previous;
  final List<DeveloperData>? results;

  DeveloperDataModel({this.count, this.next, this.previous, this.results})
      : super(count: count, next: next, previous: previous, results: results);

  factory DeveloperDataModel.fromJson(Map<String, dynamic> json) =>
      DeveloperDataModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<DeveloperData>.from(
                json["results"]!.map((x) => DeveloperData.fromJson(x))),
      );
}
