import 'package:test_assesment/core/export_common.dart';
import 'package:test_assesment/features/domain/entities/game_detail_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';

class GetDetailGameLocalUsecase implements UseCase<GameDetailEntity?, int> {
  final GameRepository repository;

  GetDetailGameLocalUsecase(this.repository);

  @override
  Future<GameDetailEntity?> call(int params) async {
    return await repository.getDetailGameLocal(id: params);
  }
}
