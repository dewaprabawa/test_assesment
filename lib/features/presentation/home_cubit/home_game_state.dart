part of 'home_game_cubit.dart';

sealed class HomeGameState extends Equatable {
  const HomeGameState();

  @override
  List<Object> get props => [];
}

class HomeGameInitial extends HomeGameState {}

class HomeGameLoading extends HomeGameState {
  const HomeGameLoading();
}

class HomeGameLoaded extends HomeGameState {
  final List<GameData> games;

  const HomeGameLoaded(this.games);
}

class HomeGameFailure extends HomeGameState {
  final String message;

  const HomeGameFailure(this.message);
}

