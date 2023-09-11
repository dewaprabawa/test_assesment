part of 'detail_game_cubit.dart';

sealed class DetailGameState extends Equatable {
  const DetailGameState();

  @override
  List<Object> get props => [];
}

final class DetailGameInitial extends DetailGameState {}

final class DetailGameLoading extends DetailGameState {}

final class DetailGameLoaded extends DetailGameState {
   final GameDetailEntity detailGame;
   const DetailGameLoaded(this.detailGame);
}

final class DetailGameFailure extends DetailGameState {
  final String message;

  const DetailGameFailure(this.message);
}

