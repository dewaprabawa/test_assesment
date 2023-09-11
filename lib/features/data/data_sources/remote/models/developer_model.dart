import 'package:test_assesment/features/domain/entities/developer_game_entity.dart';

class DeveloperModel extends DeveloperData {
  DeveloperModel({
    required int? id,
    required String? name,
    required String? slug,
    required String? image,
    required String? imageBackground,
    required String? description,
    required int? gamesCount,
  }) : super(
          id: id,
          name: name,
          slug: slug,
          image: image,
          imageBackground: imageBackground,
          description: description,
          gamesCount: gamesCount,
        );

  factory DeveloperModel.fromJson(Map<String, dynamic> json) => DeveloperModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        imageBackground: json["image_background"],
        gamesCount: json["games_count"],
        description: json["description"],
      );
}
