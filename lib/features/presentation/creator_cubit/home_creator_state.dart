part of 'home_creator_cubit.dart';

sealed class HomeCreatorState extends Equatable {
  const HomeCreatorState();

  @override
  List<Object> get props => [];
}

final class HomeCreatorInitial extends HomeCreatorState {}

final class HomeCreatorLoading extends HomeCreatorState {}


final class HomeCreatorLoaded extends HomeCreatorState {
  final List<CreatorData> creators;
  const HomeCreatorLoaded({required this.creators});
}


final class HomeCreatorFailure extends HomeCreatorState {
  final String message;

  const HomeCreatorFailure(this.message);
}
