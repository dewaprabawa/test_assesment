import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/domain/entities/creator_entity.dart';
import 'package:test_assesment/features/domain/usecases/get_all_creator_usecase.dart';
import 'package:test_assesment/features/domain/usecases/get_detail_creator_usecase.dart';

part 'home_creator_state.dart';

class HomeCreatorCubit extends Cubit<HomeCreatorState> {
  final GetAllCreatorUsecase _getAllCreatorUsecase;
  final GetDetailCreatorUsecase _getDetailCreatorUsecase;

  HomeCreatorCubit(this._getAllCreatorUsecase, this._getDetailCreatorUsecase)
      : super(const HomeCreatorState());

  int _defaultPage = 1;
  final List<CreatorData> _creatorPerPages = [];

  Future<void> getCreatorsByPage() async {
    try {
      _defaultPage++;
      emit(state.copyWith(stateEnum: CreatorStateStatus.Loading));
      final data = await _getAllCreatorUsecase.call(_defaultPage.toString());
      final creatorList = data?.results;
      if (creatorList != null) {
        _creatorPerPages.addAll(creatorList);
        emit(state.copyWith(
            stateEnum: CreatorStateStatus.Loaded, creators: _creatorPerPages));
      }
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(state.copyWith(
          stateEnum: CreatorStateStatus.Failure, message: errorMessage));
    }
  }

  Future<void> getCreatorGames() async {
    try {
      emit(state.copyWith(stateEnum: CreatorStateStatus.Loading));
      final data = await _getAllCreatorUsecase.call("1");
      final creatorList = data?.results;
      if (creatorList != null) {
        emit(state.copyWith(
            stateEnum: CreatorStateStatus.Loaded, creators: creatorList));
      } else {
        emit(state.copyWith(stateEnum: CreatorStateStatus.Loaded, creators: []));
      }
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(state.copyWith(
          stateEnum: CreatorStateStatus.Failure, message: errorMessage));
    }
  }

  Future<void> getDetailCreatorGames(int id) async {
    emit(state.copyWith(stateEnum: CreatorStateStatus.Loading));
    try {
      final data = await _getDetailCreatorUsecase.call(id);
      final creatorList = data?.results;
      if (creatorList != null) {
        emit(state.copyWith(
            stateEnum: CreatorStateStatus.Loaded, creator: creatorList.first));
      }
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(state.copyWith(
          stateEnum: CreatorStateStatus.Failure, message: errorMessage));
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
