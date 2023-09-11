import 'package:test_assesment/core/common/usecase.dart';
import 'package:test_assesment/features/domain/entities/creator_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';

class GetAllCreatorUsecase implements UseCase<CreatorEntity?, String> {
  final GameRepository repository;

  GetAllCreatorUsecase(this.repository);

  @override
  Future<CreatorEntity?> call(String params) async {
    return await repository.getAllCreators(page: params);
  }
}
