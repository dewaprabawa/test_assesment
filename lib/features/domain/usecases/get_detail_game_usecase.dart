import 'package:test_assesment/core/common/usecase.dart';
import 'package:test_assesment/features/domain/entities/game_detail_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';

class GetDetailGameUsecase implements UseCase<GameDetailEntity?, int> {
  final GameRepository repository;

  GetDetailGameUsecase(this.repository);

  @override
  Future<GameDetailEntity?> call(int params) async {
    return await repository.getDetailGame(id: params);
  }
}
