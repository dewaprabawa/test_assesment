import 'package:test_assesment/core/common/usecase.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';

class GetAllGameUsecase implements UseCase<GameEntity?, String> {
  final GameRepository repository;

  GetAllGameUsecase(this.repository);

  @override
  Future<GameEntity?> call(String params) async {
    return await repository.getAllGames(page: params);
  }
}
