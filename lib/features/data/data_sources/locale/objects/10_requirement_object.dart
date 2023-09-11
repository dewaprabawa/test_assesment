import 'package:hive/hive.dart';
import 'package:test_assesment/features/domain/entities/requirement_entity.dart';

part '10_requirement_object.g.dart';

@HiveType(typeId: 10) // Change the typeId if needed
class RequirementsObject extends HiveObject {
  @HiveField(0)
  final String? minimum;
  @HiveField(1)
  final String? recommended;

  RequirementsObject({
    this.minimum,
    this.recommended,
  });

  factory RequirementsObject.fromEntity(RequirementsEntity entity) =>
      RequirementsObject(
        minimum: entity.minimum,
        recommended: entity.recommended,
      );

  RequirementsEntity toEntity() =>
      RequirementsEntity(minimum: minimum, recommended: recommended);
}
