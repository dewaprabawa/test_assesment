import 'dart:convert';

import 'package:test_assesment/core/common/strings.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/core/request/base_client.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/creator_model.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/developer_data_model.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/game_detail_model.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/game_model.dart';

abstract class GameRemoteDataSource {
  Future<GameModel> getAllGames({String? page});
  Future<GameDetailModel> getDetailGame({int? id});
  Future<CreatorModel> getAllCreatorGames({String? page});
  Future<DeveloperDataModel> getAllDeveloperGames({String? page});
}

class GameRemoteDataSourceImpl implements GameRemoteDataSource {
  final BaseClient baseClient;

  GameRemoteDataSourceImpl(this.baseClient);

  @override
  Future<GameModel> getAllGames({String? page}) async {
    final response = await baseClient.requestNetwork(
        method: Method.GET,
        path: PathURLconstants.GAMES,
        queryParameters: {"page": page ?? "1"});
    if (response?.statusCode == 200) {
      try {
        return GameModel.fromJson(jsonDecode(response?.data));
      } catch (_) {
        throw FormatException();
      }
    }else if(response?.statusCode == 404){
        throw ServerNotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GameDetailModel> getDetailGame({int? id}) async {
    final response = await baseClient.requestNetwork(
      method: Method.GET,
      path: "${PathURLconstants.GAMES}/$id",
      queryParameters: {}
    );
    if (response?.statusCode == 200) {
      try{
        return GameDetailModel.fromJson(jsonDecode(response?.data));
      }catch(error){
        print(error);
         throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<CreatorModel> getAllCreatorGames({String? page}) async {
     final response = await baseClient.requestNetwork(
        method: Method.GET,
        path: PathURLconstants.GAMES,
        queryParameters: {"page": page ?? "1"});
    if (response?.statusCode == 200) {
      try {
        return CreatorModel.fromJson(jsonDecode(response?.data));
      } catch (_) {
        throw FormatException();
      }
    }else if(response?.statusCode == 404){
        throw ServerNotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DeveloperDataModel> getAllDeveloperGames({String? page}) async {
     final response = await baseClient.requestNetwork(
        method: Method.GET,
        path: PathURLconstants.DEVELOPER,
        queryParameters: {"page": page ?? "1"});
    if (response?.statusCode == 200) {
      try {
        return DeveloperDataModel.fromJson(jsonDecode(response?.data));
      } catch (_) {
        throw FormatException();
      }
    }else if(response?.statusCode == 404){
        throw ServerNotFoundException();
    } else {
      throw ServerException();
    }
  }
}
