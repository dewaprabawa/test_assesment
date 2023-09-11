import 'package:test_assesment/core/common/usecase.dart';
import 'package:test_assesment/features/domain/entities/creator_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';

class GetDetailCreatorUsecase implements UseCase<CreatorEntity?, int> {
  final GameRepository repository;

  GetDetailCreatorUsecase(this.repository);

  @override
  Future<CreatorEntity?> call(int params) async {
    return await repository.getCreatorDetailGame(id: params);
  }
}
