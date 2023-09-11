import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dio/dio.dart';
import 'package:test_assesment/core/common/strings.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/core/request/base_client.dart';
import 'package:test_assesment/features/data/data_sources/remote/game_remote_data_source.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/game_detail_model.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/game_model.dart';

import '../../../json/read_json_file.dart';
@GenerateNiceMocks([MockSpec<BaseClient>(), MockSpec<Response>()])
import 'game_remote_data_source_test.mocks.dart';

void main() {
  group("GameRemoteDataSourceImpl", () {
    late GameRemoteDataSource gameRemoteDataSourceImpl;
    late MockBaseClient mockBaseClient; // Use your generated mock

    setUp(() {
      mockBaseClient = MockBaseClient();
      gameRemoteDataSourceImpl = GameRemoteDataSourceImpl(mockBaseClient);
    });

    test('getAllGames should return a GameModel on success', () async {
      final jsonFilePath =
          'test/json/game_json_response.json'; // Specify the path to your JSON file
      final jsonString = await readJsonFile(jsonFilePath);
      // Arrange
      const String page = "1"; // Provide the page you want to test

      when(mockBaseClient.requestNetwork(
        method: Method.GET,
        path: PathURLconstants.GAMES,
        queryParameters: {"page": page},
      )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 200,
            data: jsonString,
          ));

      // Act
      final result = await gameRemoteDataSourceImpl.getAllGames(page: page);

      // Assert
      expect(result, isA<GameModel>());
    });

    test('getAllGames should success on 200 status code', () async {
      final jsonFilePath =
          'test/json/game_json_response.json'; // Specify the path to your JSON file
      final jsonString = await readJsonFile(jsonFilePath);
      // Arrange
      final String page = "1";
      final on200Response = Response(
          requestOptions: RequestOptions(path: ''),
          data: jsonString,
          statusCode: 200); // Simulate a non-200 status code

      when(mockBaseClient.requestNetwork(
        method: Method.GET,
        path: PathURLconstants.GAMES,
        queryParameters: {"page": page},
      )).thenAnswer((_) async => on200Response);

      final result = await gameRemoteDataSourceImpl.getAllGames(page: page);

      // Act & Assert
      expect(
        result,
        isA<GameModel>(), // Expect the function to throw a ServerException
      );
    });

    test('getAllGames should throw ServerException on non-200 status code',
        () async {
      // Arrange
      final String page = "1";
      final non200Response = Response(
          requestOptions: RequestOptions(path: ''),
          data: 'error data',
          statusCode: 501); // Simulate a non-200 status code

      when(mockBaseClient.requestNetwork(
        method: Method.GET,
        path: PathURLconstants.GAMES,
        queryParameters: {"page": page},
      )).thenAnswer((_) async => non200Response);

      // Act & Assert
      expect(
        () async => await gameRemoteDataSourceImpl.getAllGames(page: page),
        throwsA(isA<
            ServerException>()), // Expect the function to throw a ServerException
      );
    });

     test('getAllGames should throw ServerNotFoundException on 404 status code',
        () async {
      // Arrange
      final String page = "1";
      final non200Response = Response(
          requestOptions: RequestOptions(path: ''),
          data: 'error data',
          statusCode: 404); // Simulate a non-200 status code

      when(mockBaseClient.requestNetwork(
        method: Method.GET,
        path: PathURLconstants.GAMES,
        queryParameters: {"page": page},
      )).thenAnswer((_) async => non200Response);

      // Act & Assert
      expect(
        () async => await gameRemoteDataSourceImpl.getAllGames(page: page),
        throwsA(isA<
            ServerNotFoundException>()), // Expect the function to throw a ServerException
      );
    });


 test('getAllGames should throw ServerException on null response', () async {
  // Arrange
  final String page = "1";

  when(mockBaseClient.requestNetwork(
    method: Method.GET,
    path: PathURLconstants.GAMES,
    queryParameters: {"page": page},
  )).thenAnswer((_) async => null); // Simulate a null response

  // Act & Assert
  expect(
    () async => await gameRemoteDataSourceImpl.getAllGames(page: page),
    throwsA(isA<ServerException>()),
  );
});

test('getAllGames should throw ServerException on non-JSON response', () async {
  // Arrange
  final String page = "1";
  final nonJsonResponse = Response(
    requestOptions: RequestOptions(path: ''),
    statusCode: 200,
    data: 'This is not JSON', // Simulate a non-JSON response
  );

  when(mockBaseClient.requestNetwork(
    method: Method.GET,
    path: PathURLconstants.GAMES,
    queryParameters: {"page": page},
  )).thenAnswer((_) async => nonJsonResponse);

  // Act & Assert
  expect(
    () async => await gameRemoteDataSourceImpl.getAllGames(page: page),
    throwsA(isA<ServerException>()),
  );
});

test('getAllGames should throw ServerException on invalid JSON response', () async {
  // Arrange
  final String page = "1";
  final invalidJsonResponse = Response(
    requestOptions: RequestOptions(path: ''),
    statusCode: 200,
    data: '{invalid_json}', // Simulate invalid JSON data
  );

  when(mockBaseClient.requestNetwork(
    method: Method.GET,
    path: PathURLconstants.GAMES,
    queryParameters: {"page": page},
  )).thenAnswer((_) async => invalidJsonResponse);

  // Act & Assert
  expect(
    () async => await gameRemoteDataSourceImpl.getAllGames(page: page),
    throwsA(isA<ServerException>()),
  );
});




    test('getDetailGame should return a GameDetailModel on success', () async {
      final jsonFilePath =
          'test/json/game_detail_json_response.json'; // Specify the path to your JSON file
      final jsonString = await readJsonFile(jsonFilePath);
      // Arrange
      final int gameId = 3498; // Provide a valid game ID for testing

      when(mockBaseClient.requestNetwork(
        method: Method.GET,
        path: "${PathURLconstants.GAMES}/$gameId",
      )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 200,
            data: jsonString,
          ));

      // Act
      final result = await gameRemoteDataSourceImpl.getDetailGame(id: gameId);

      // Assert
      expect(result, isA<GameDetailModel>());
    });
  });
}



class TestBaseClient implements BaseClient {
  @override
  Future<Response?> requestNetwork({
    required Method method,
    required String path,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final jsonFilePath =
        'test/json/game_detail_json_response.json'; // Specify the path to your JSON file
    final jsonString = await readJsonFile(jsonFilePath);
    // Simulate a 200 response for testing purposes
    if (path == "your_test_path") {
      return Response(
        requestOptions: RequestOptions(path: path),
        statusCode: 200,
        data: jsonString, // Your desired response data
      );
    }

    // Simulate a non-200 response for testing error handling
    return Response(
      requestOptions: RequestOptions(path: path),
      statusCode: 404, // Or any other error code you want to simulate
      data: {"error": "Not Found"}, // Your desired error response data
    );
  }
}
