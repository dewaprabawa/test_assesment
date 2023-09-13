import 'package:hive/hive.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/15_creator_data_object.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/game_detail_model.dart';
import 'package:test_assesment/features/domain/entities/creator_entity.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';

import 'objects/13_game_data_object.dart';
import 'objects/14_game_detail_object.dart';



abstract class GameLocalDataSource {
  Future<void> persistGame(GameData gameModel);
  Future<void> persistCreator(CreatorData creatorModel);
  Future<List<GameData>> getAllGames();
    Future<List<GameData>> searchGames({required String text});
  Future<void> pesistDetailGame(GameDetailModel gameDetailModel);
  Future<GameDetailModel?> getDetailGame({required int id});
  Future<List<CreatorData>> getCreatorGames();
}

class GameLocalDataSourceImpl extends GameLocalDataSource {
  final Box<GameDataObject> _boxGameData;
  final Box<GameDetailObject> _boxGameDetail;
  final Box<CreatorDataObject> _boxCreatorData;

  GameLocalDataSourceImpl(this._boxGameData, this._boxGameDetail, this._boxCreatorData);

  @override
  Future<void> persistGame(GameData gameModel) async {
    try {
      final game = GameDataObject.fromEntity(gameModel);
      await persistGameIfNotExists(game);
    } catch (error) {
      print(error);
      throw LocalException();
    }
  }

  @override
  Future<List<GameData>> getAllGames() async {
    try {
      return _boxGameData.values
          .toList()
          .map((element) => element.toEntity())
          .toList();
    } catch (_) {
      throw LocalException();
    }
  }

  @override
  Future<void> pesistDetailGame(GameDetailModel gameDetailModel) async {
    try {
      final gameDetail = GameDetailObject.fromEntity(gameDetailModel);
      if (!_boxGameDetail.containsKey(gameDetail.id)) {
        await _boxGameDetail.put(gameDetail.id, gameDetail);
      } 
    } catch (error) {
        print(error);
      throw LocalException();
    }
  }

  @override
  Future<GameDetailModel?> getDetailGame({required int id}) async {
    try {
      final gameDetail = _boxGameDetail.get(id);
      return gameDetail?.toModel();
    } catch (error) {
         print(error);
      throw LocalException();
    }
  }

  Future<void> persistGameIfNotExists(GameDataObject game) async {
    if (!_boxGameData.containsKey(game.id)) {
      await _boxGameData.put(game.id, game);
    } 
  }
  
  @override
  Future<List<GameData>> searchGames({required String text}) async {
   final allGames = _boxGameData.values
      .map((element) => element.toEntity())
      .toList();


   final regex = RegExp(_buildFuzzySearchRegex(text), caseSensitive: false);

  final filteredGames = allGames.where((game) {
    final gameName = game.name?.toLowerCase() ?? ''; // Handle null values gracefully
    return regex.hasMatch(gameName);
  }).toList();

   return filteredGames.isEmpty ? [] : filteredGames;
  }

  String _buildFuzzySearchRegex(String text) {
  final escapedText = RegExp.escape(text);
  final pattern = escapedText.split('').map((char) {
    return '($char)';
  }).join('.*?');

  return pattern;
}

  @override
  Future<List<CreatorData>> getCreatorGames() async {
    try {
      return _boxCreatorData.values
          .toList()
          .map((element) => element.toEntity())
          .toList();
    } catch (_) {
      throw LocalException();
    }
  }
  
  @override
  Future<void> persistCreator(CreatorData creatorModel) async {
    try {
      final creator = CreatorDataObject.fromEntity(creatorModel);
      await persistCreatorIfNotExists(creator);
    } catch (error) {
      throw LocalException();
    }
  }

    Future<void> persistCreatorIfNotExists(CreatorDataObject game) async {
    if (!_boxCreatorData.containsKey(game.id)) {
      await _boxCreatorData.put(game.id, game);
    } 
  }
}
