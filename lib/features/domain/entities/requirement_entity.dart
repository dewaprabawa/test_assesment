class RequirementsEntity {
  final String? minimum;
  final String? recommended;

  RequirementsEntity({
    this.minimum,
    this.recommended,
  });

  factory RequirementsEntity.fromJson(Map<String, dynamic> json) =>
      RequirementsEntity(
        minimum: json["minimum"],
        recommended: json["recommended"],
      );
}
