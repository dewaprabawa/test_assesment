import 'package:test_assesment/features/domain/entities/creator_entity.dart';
import 'package:test_assesment/features/domain/entities/developer_game_entity.dart';
import 'package:test_assesment/features/domain/entities/game_detail_entity.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';

abstract class GameRepository {
  Future<GameEntity?> getAllGames({String? page});
  Future<CreatorEntity> getAllCreators({String? page});
  Future<DeveloperDataEntity> getAllDevelopers({String? page});
  Future<GameEntity> searchGames({String? text});
  Future<GameDetailEntity?> getDetailGame({required int id});
  Future<DeveloperData?> getDeveloperDetailGame({required int id});
  Future<CreatorEntity?> getCreatorDetailGame({required int id});
  Future<GameDetailEntity?> getDetailGameLocal({required int id});
}
