import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/domain/entities/developer_game_entity.dart';
import 'package:test_assesment/features/domain/usecases/get_all_developer_usecase.dart';

part 'home_developer_state.dart';

class DeveloperCubit extends Cubit<DeveloperState> {

  final GetAllDeveloperUsecase _getAllDeveloperUsecase;
  DeveloperCubit(this._getAllDeveloperUsecase) : super(DeveloperInitial());

  Future<void> getDeveloperGames() async {
    emit(DeveloperLoading());
    try {
      final data = await _getAllDeveloperUsecase.call("1");
      final developerList =  data?.results;
      if (developerList != null) {
        emit(DeveloperLoaded(developers: developerList));
      } else {
        emit(const DeveloperLoaded(developers: []));
      }
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(DeveloperFailure(message: errorMessage));
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
