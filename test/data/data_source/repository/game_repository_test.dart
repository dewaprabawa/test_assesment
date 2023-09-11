import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_assesment/core/common/network_checker.dart';
import 'package:test_assesment/features/data/data_sources/locale/game_local_data_source.dart';
import 'package:test_assesment/features/data/data_sources/remote/game_remote_data_source.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/game_model.dart';
import 'package:test_assesment/features/data/repositories/game_repository_impl.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';

@GenerateNiceMocks([MockSpec<GameRemoteDataSource>(), MockSpec<GameLocalDataSource>(), MockSpec<NetworkInfo>()])
import 'game_repository_test.mocks.dart';
void main() {
  late GameRepositoryImpl repository;
  late MockGameRemoteDataSource mockRemoteDataSource;
  late MockGameLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockGameRemoteDataSource();
    mockLocalDataSource = MockGameLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = GameRepositoryImpl(
      mockRemoteDataSource,
      mockLocalDataSource,
      mockNetworkInfo,
    );
  });

  group('getAllGames', () {
    final page = '1';
    final testGameModel = GameModel(
      next: "",
      previous: "",
      count: 0,
      results: [GameData()]);
      final GameEntity testGameEntity = testGameModel;

    test('should return remote data when the device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAllGames(page: page)).thenAnswer((_) async => testGameModel);

      // Act
      final result = await repository.getAllGames(page: page);

      // Assert
      verify(mockNetworkInfo.isConnected);
      verify(mockRemoteDataSource.getAllGames(page: page));
      verify(mockLocalDataSource.persistGame(any)).called(testGameModel.results?.length); // Verify that _localDataSource.persistGame is called for each game
      expect(result, equals(testGameEntity));
    });

    test('should return local data when the device is offline', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getAllGames()).thenAnswer((_) async => [GameData()]);

      // Act
      final result = await repository.getAllGames(page: page);

      // Assert
      verify(mockNetworkInfo.isConnected);
      verifyZeroInteractions(mockRemoteDataSource); // Verify that _remoteDataSource.getAllGames is not called
      verify(mockLocalDataSource.getAllGames());
      expect(result, isA<GameEntity>());
    });

    // Add more test cases for edge cases and error handling

    // ...
  });
  
  // Add more test cases for getDetailGame and edge cases as needed

}
