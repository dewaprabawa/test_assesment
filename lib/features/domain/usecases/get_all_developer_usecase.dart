import 'package:test_assesment/core/common/usecase.dart';
import 'package:test_assesment/features/domain/entities/developer_game_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';

class GetAllDeveloperUsecase implements UseCase<DeveloperDataEntity?, String> {
  final GameRepository repository;

  GetAllDeveloperUsecase(this.repository);

  @override
  Future<DeveloperDataEntity?> call(String params) async {
    return await repository.getAllDevelopers(page: params);
  }
}
