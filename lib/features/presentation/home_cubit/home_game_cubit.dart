import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';
import 'package:test_assesment/features/domain/usecases/get_all_game_usecase.dart';
import 'package:test_assesment/features/domain/usecases/search_game_usecase.dart';

part 'home_game_state.dart';

class HomeGameCubit extends Cubit<HomeGameState> {
  final GetAllGameUsecase _getAllGameUsecase;
  final SearchGameUsecase _searchGameUsecase;

  HomeGameCubit(this._getAllGameUsecase, this._searchGameUsecase) : super(HomeGameInitial());

  int _defaultPage = 1;
  final List<GameData> _gamePerPages = [];

  Future<void> getGamesByPage() async {
    try {
      _defaultPage++;
      emit(const HomeGameLoading());
      final data = await _getAllGameUsecase.call(_defaultPage.toString());
      final gameList = data?.results;
      if (gameList != null) {
        _gamePerPages.addAll(gameList);
        emit(HomeGameLoaded(_gamePerPages));
      } 
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(HomeGameFailure(errorMessage));
    }
  }

  Future<void> getAllGames() async {
    emit(HomeGameLoading());
    try {
      final data = await _getAllGameUsecase.call("1");
      final gameList =  data?.results;
      if (gameList != null) {
        emit(HomeGameLoaded(gameList));
      } else {
        emit(const HomeGameLoaded([]));
      }
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(HomeGameFailure(errorMessage));
    }
  }

  Future<void> refreshAllGames() async {
    try {
      final data = await _getAllGameUsecase.call("1");
      final gameList =  data?.results;
      if (gameList != null) {
        emit(HomeGameLoaded(gameList));
      } else {
        emit(const HomeGameLoaded([]));
      }
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(HomeGameFailure(errorMessage));
    }
  }
 

  Future<void> searchGames(String searchText) async {
    emit(HomeGameLoading());
    try {
      final data = await _searchGameUsecase.call(searchText);
      final gameList = data.results;
      if (gameList != null) {
        emit(HomeGameLoaded(gameList));
      } else {
        emit(const HomeGameLoaded([]));
      }
    } catch (exception) {
      final errorMessage = _getErrorMessage(exception);
      emit(HomeGameFailure(errorMessage));
    }
  }
  

  String _getErrorMessage(dynamic exception) {
    if (exception is ServerException ||
        exception is LocalException ||
        exception is ServerNotFoundException) {
      return "An error occurred when requesting data.";
    } else if (exception is SocketException) {
      return "Your device is not connected to the internet.";
    }
    return "An unexpected error occurred.";
  }
}
