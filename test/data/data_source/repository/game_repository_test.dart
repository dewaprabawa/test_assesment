import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_assesment/core/common/network_checker.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/data/data_sources/locale/game_local_data_source.dart';
import 'package:test_assesment/features/data/data_sources/remote/game_remote_data_source.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/creator_model.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/developer_data_model.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/game_detail_model.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/game_model.dart';
import 'package:test_assesment/features/data/repositories/game_repository_impl.dart';
import 'package:test_assesment/features/domain/entities/creator_entity.dart';
import 'package:test_assesment/features/domain/entities/developer_game_entity.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';
import 'package:test_assesment/features/domain/entities/game_detail_entity.dart';

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
      verify(mockLocalDataSource.persistGame(any)).called(testGameModel.results?.length); 
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
      verifyZeroInteractions(mockRemoteDataSource); 
      verify(mockLocalDataSource.getAllGames());
      expect(result, isA<GameEntity>());
    });

    
  });

   group('getDetailGame', () {
    final gameId = 1;
    final testGameDetailModel = GameDetailModel(); 

    test('should return remote data when the device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getDetailGame(id: gameId))
          .thenAnswer((_) async => testGameDetailModel);

      // Act
      final result = await repository.getDetailGame(id: gameId);

      // Assert
      verify(mockNetworkInfo.isConnected);
      verify(mockRemoteDataSource.getDetailGame(id: gameId));
      verify(mockLocalDataSource.pesistDetailGame(testGameDetailModel));
      expect(result, equals(testGameDetailModel));
    });

    test('should return local data when the device is offline', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getDetailGame(id: gameId))
          .thenAnswer((_) async => testGameDetailModel);

      // Act
      final result = await repository.getDetailGame(id: gameId);

      // Assert
      verify(mockNetworkInfo.isConnected);
      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockLocalDataSource.getDetailGame(id: gameId));
      expect(result, equals(testGameDetailModel));
    });
  });


   group('getAllCreators', () {
    final page = '1';
    final testCreatorsModel = CreatorModel(count: null, next: '', previous: '', results: []); 

    test('should return remote data when the device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAllCreatorGames())
          .thenAnswer((_) async => testCreatorsModel);

      // Act
      final result = await repository.getAllCreators(page: page);

      // Assert
      verify(mockNetworkInfo.isConnected);
      verify(mockRemoteDataSource.getAllCreatorGames());
      verify(mockLocalDataSource.persistCreator(any)).called(testCreatorsModel.results?.length);
      expect(result, equals(testCreatorsModel));
    });

    test('should return local data when the device is offline', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getCreatorGames())
          .thenAnswer((_) async => []);

      // Act
      final result = await repository.getAllCreators(page: page);

      // Assert
      verify(mockNetworkInfo.isConnected);
      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockLocalDataSource.getCreatorGames());
      expect(result, isA<CreatorEntity>());
    });
  });

  group('getAllDevelopers', () {
    final page = '1';
    final testDevelopersModel = DeveloperDataModel(); 

    test('should return remote data when the device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAllDeveloperGames(page: page))
          .thenAnswer((_) async => testDevelopersModel);

      // Act
      final result = await repository.getAllDevelopers(page: page);

      // Assert
      verify(mockNetworkInfo.isConnected);
      verify(mockRemoteDataSource.getAllDeveloperGames(page: page));
      expect(result, equals(testDevelopersModel));
    });

    test('should throw a SocketException when the device is offline', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // Act and Assert
      expect(() => repository.getAllDevelopers(page: page), throwsA(isA<SocketException>()));
      verify(mockNetworkInfo.isConnected);
      verifyZeroInteractions(mockRemoteDataSource);
    });
  });
  

}
