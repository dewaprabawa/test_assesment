part of 'home_creator_cubit.dart';


enum CreatorStateStatus { Initial, Loading, Loaded, Failure }

class HomeCreatorState extends Equatable {
  final List<CreatorData>? creators;
  final CreatorData? creator;
  final String? message;
  final CreatorStateStatus stateEnum;

  const HomeCreatorState(
      {this.stateEnum = CreatorStateStatus.Initial,
      this.creator,
      this.creators,
      this.message});

  HomeCreatorState copyWith(
    {CreatorStateStatus? stateEnum,
    List<CreatorData>? creators,
    CreatorData? creator,
    String? message}
  ) {
    return HomeCreatorState(
        stateEnum: stateEnum ?? this.stateEnum,
        creator: creator ?? this.creator,
        creators: creators ?? this.creators,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [
        creator,
        creators,
        stateEnum,
        message,
      ];
}
