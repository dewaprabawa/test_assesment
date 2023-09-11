import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/domain/entities/game_detail_entity.dart';
import 'package:test_assesment/features/domain/export_usecases.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';
import 'package:test_assesment/features/domain/usecases/get_detail_game_local_usecase.dart';

part 'detail_game_state.dart';

class DetailGameCubit extends Cubit<DetailGameState> {
  DetailGameCubit(this._detailGameUsecase, this._detailGameLocalUsecase)
      : super(DetailGameInitial());

  final GetDetailGameUsecase _detailGameUsecase;
  final GetDetailGameLocalUsecase _detailGameLocalUsecase;

  Future<void> getDetailGame(int id) async {
    emit(DetailGameLoading());
    try {
      final localGameDetail = await _detailGameLocalUsecase.call(id);
       if(localGameDetail != null) {
        emit(DetailGameLoaded(localGameDetail));
      } else {
        final gameDetail = await _detailGameUsecase.call(id);
        if (gameDetail != null) {
          emit(DetailGameLoaded(gameDetail));
        } else {
          emit(const DetailGameFailure("No Data Found."));
        }
      }
    } catch (exceptions) {
      final errorMessage = _getErrorMessage(exceptions);
      emit(DetailGameFailure(errorMessage));
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
