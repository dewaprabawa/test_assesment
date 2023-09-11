import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/domain/entities/creator_entity.dart';
import 'package:test_assesment/features/domain/usecases/get_all_creator_usecase.dart';

part 'home_creator_state.dart';

class HomeCreatorCubit extends Cubit<HomeCreatorState> {

  final GetAllCreatorUsecase _getAllCreatorUsecase;

  HomeCreatorCubit(this._getAllCreatorUsecase) : super(HomeCreatorInitial());

   Future<void> getCreatorGames() async {
    emit(HomeCreatorLoading());
    try {
      final data = await _getAllCreatorUsecase.call("1");
      final creatorList =  data?.results;
      if (creatorList != null) {
        emit(HomeCreatorLoaded(creators: creatorList));
      } else {
        emit(const HomeCreatorLoaded(creators: []));
      }
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(HomeCreatorFailure(errorMessage));
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
