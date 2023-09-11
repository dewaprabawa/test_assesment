import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/domain/entities/developer_game_entity.dart';
import 'package:test_assesment/features/domain/usecases/get_all_developer_usecase.dart';
import 'package:test_assesment/features/domain/usecases/get_detail_developer_usecase.dart';

part 'home_developer_state.dart';

class DeveloperCubit extends Cubit<DeveloperState> {
  final GetAllDeveloperUsecase _getAllDeveloperUsecase;
  final GetDetailDeveloperUsecase _detailDeveloperUsecase;

  DeveloperCubit(this._getAllDeveloperUsecase, this._detailDeveloperUsecase)
      : super(const DeveloperState());

  int _defaultPage = 1;
  final List<DeveloperData> _developerPerPages = [];

  Future<void> getCreatorsByPage() async {
    try {
      _defaultPage++;
      emit(state.copyWith(stateEnum: DeveloperStateStatus.Loading));
      final data = await _getAllDeveloperUsecase.call(_defaultPage.toString());
      final creatorList = data?.results;
      if (creatorList != null) {
        _developerPerPages.addAll(creatorList);
        emit(state.copyWith(
            stateEnum: DeveloperStateStatus.Loaded, developers: _developerPerPages));
      }
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(state.copyWith(
          stateEnum: DeveloperStateStatus.Failure, message: errorMessage));
    }
  }

  Future<void> getDeveloperGames() async {
    try {
      emit(state.copyWith(stateEnum: DeveloperStateStatus.Loading));
      final data = await _getAllDeveloperUsecase.call("1");
      final developerList = data?.results;
      if (developerList != null) {
        emit(state.copyWith(
            stateEnum: DeveloperStateStatus.Loaded, developers: developerList));
      } else {
        emit(state.copyWith(stateEnum: DeveloperStateStatus.Loaded, developers: []));
      }
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(state.copyWith(
          stateEnum: DeveloperStateStatus.Failure, message: errorMessage));
    }
  }

  Future<void> getDetailDeveloperGame(int id) async {
    try {
      emit(state.copyWith(stateEnum: DeveloperStateStatus.Loading));
      final data = await _detailDeveloperUsecase.call(id);
      if (data != null) {
        emit(state.copyWith(stateEnum: DeveloperStateStatus.Loaded, developer: data));
      }
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(state.copyWith(
          stateEnum: DeveloperStateStatus.Failure, message: errorMessage));
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
