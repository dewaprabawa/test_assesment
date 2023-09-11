import 'dart:math';

import 'package:test_assesment/core/common/network_checker.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/data/data_sources/locale/game_local_data_source.dart';
import 'package:test_assesment/features/data/data_sources/remote/game_remote_data_source.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/creator_model.dart';
import 'package:test_assesment/features/domain/entities/creator_entity.dart';
import 'package:test_assesment/features/domain/entities/developer_game_entity.dart';
import 'package:test_assesment/features/domain/entities/game_detail_entity.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  final GameRemoteDataSource _remoteDataSource;
  final GameLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  GameRepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<GameEntity> getAllGames({String? page}) async {
    if (await _networkInfo.isConnected) {
      try {
        final allGames = await _remoteDataSource.getAllGames(page: page);
        for (GameData game in allGames.results ?? []) {
          await _localDataSource.persistGame(game);
        }
        return allGames;
      } catch (_) {
        throw ServerException();
      }
    } else {
      try {
        final allGames = await _localDataSource.getAllGames();
        if (allGames.isEmpty) {
          throw SocketException();
        }
        return GameEntity(results: allGames);
      } catch (_) {
        throw LocalException();
      }
    }
  }

  @override
  Future<GameDetailEntity?> getDetailGame({required int id}) async {
    if (await _networkInfo.isConnected) {
      try {
        final gameDetail = await _remoteDataSource.getDetailGame(id: id);
        await _localDataSource.pesistDetailGame(gameDetail);
        return gameDetail;
      } catch (error) {
        throw LocalException();
      }
    } else {
      try {
        final detailGame = await _localDataSource.getDetailGame(id: id);
        return detailGame;
      } catch (_) {
        throw LocalException();
      }
    }
  }

  @override
  Future<GameEntity> searchGames({String? text}) async {
    try {
      final allGames = await _localDataSource.searchGames(text: text ?? "");
      return GameEntity(results: allGames);
    } catch (_) {
      throw LocalException();
    }
  }

  @override
  Future<GameDetailEntity?> getDetailGameLocal({required int id}) async {
    try {
      final detailGame = await _localDataSource.getDetailGame(id: id);
      if (detailGame != null) {
        return detailGame;
      }
      return null;
    } catch (_) {
      throw LocalException();
    }
  }

  @override
  Future<CreatorEntity> getAllCreators({String? page}) async {
    if (await _networkInfo.isConnected) {
      try {
        final allCreators = await _remoteDataSource.getAllCreatorGames();
        for (CreatorData creator in allCreators.results ?? []) {
          await _localDataSource.persistCreator(creator);
        }
        return allCreators;
      } catch (error) {
        print(error);
        throw ServerException();
      }
    } else {
      try {
        final allCreators = await _localDataSource.getCreatorGames();
        if (allCreators.isEmpty) {
          throw SocketException();
        }
        return CreatorEntity(results: allCreators);
      } catch (_) {
        throw LocalException();
      }
    }
  }

  @override
  Future<DeveloperDataEntity> getAllDevelopers({String? page}) async {
    if (await _networkInfo.isConnected) {
      try {
        final allDevelopers =
            await _remoteDataSource.getAllDeveloperGames(page: page);
        return allDevelopers;
      } catch (_) {
        throw ServerException();
      }
    } else {
      throw SocketException();
    }
  }
}
