part of 'home_developer_cubit.dart';

enum DeveloperStateStatus { Initial, Loading, Loaded, Failure }

class DeveloperState extends Equatable {
  final List<DeveloperData>? developers;
  final DeveloperData? developer;
  final String? message;
  final DeveloperStateStatus stateEnum;

  const DeveloperState(
      {this.stateEnum = DeveloperStateStatus.Initial,
      this.developer,
      this.developers,
      this.message});

  DeveloperState copyWith(
    {DeveloperStateStatus? stateEnum,
    List<DeveloperData>? developers,
    DeveloperData? developer,
    String? message}
  ) {
    return DeveloperState(
        stateEnum: stateEnum ?? this.stateEnum,
        developer: developer ?? this.developer,
        developers: developers ?? this.developers,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [
        developer,
        developers,
        stateEnum,
        message
      ];
}
