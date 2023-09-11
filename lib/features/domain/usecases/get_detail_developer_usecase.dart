import 'package:test_assesment/core/common/usecase.dart';
import 'package:test_assesment/features/domain/entities/developer_game_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';

class GetDetailDeveloperUsecase implements UseCase<DeveloperData?, int> {
  final GameRepository repository;

  GetDetailDeveloperUsecase(this.repository);

  @override
  Future<DeveloperData?> call(int params) async {
    return await repository.getDeveloperDetailGame(id: params);
  }
}
