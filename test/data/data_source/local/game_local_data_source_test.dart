import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/data/data_sources/locale/game_local_data_source.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/13_game_data_object.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/14_game_detail_object.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/15_creator_data_object.dart';
import 'package:test_assesment/features/data/data_sources/remote/models/game_detail_model.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';

import 'game_local_data_source_test.mocks.dart';


@GenerateNiceMocks([MockSpec<Box>()])
void main() {
  late GameLocalDataSourceImpl dataSource;
  late MockBox<GameDataObject> mockGameDataObjectBox;
  late MockBox<GameDetailObject> mockGameDetailObjectBox;
  late MockBox<CreatorDataObject> mockCreatorDataObjectBox;

  setUp(() {
    mockGameDataObjectBox = MockBox<GameDataObject>();
    mockGameDetailObjectBox = MockBox<GameDetailObject>();
    mockCreatorDataObjectBox = MockBox<CreatorDataObject>();
    dataSource = GameLocalDataSourceImpl(mockGameDataObjectBox, mockGameDetailObjectBox, mockCreatorDataObjectBox);
  });

  group('persistGame', () {

    test('should persist game data when the game is not in the box', () async {
      // Arrange
      final gameDataObject = GameDataObject(id: 1, name: 'Test Game');
      when(mockGameDataObjectBox.containsKey(1)).thenReturn(false);

      // Act
      await dataSource.persistGameIfNotExists(gameDataObject);

      // Assert
      verify(mockGameDataObjectBox.put(1, gameDataObject)).called(1);
    });

    test('should throw LocalException when the game already exists in the box', () async {
      // Arrange
      final gameDataObject = GameDataObject(id: 1, name: 'Test Game');
      when(mockGameDataObjectBox.containsKey(1)).thenReturn(true);

      // Act and Assert
      expect(() => dataSource.persistGameIfNotExists(gameDataObject), throwsA(isInstanceOf<LocalException>()));
      verifyNever(mockGameDataObjectBox.put(1, gameDataObject));
    });
  });

  group('getAllGames', () {
    final gameDataObjects = [
      GameDataObject(id: 1, name: 'Test Game 1'),
      GameDataObject(id: 2, name: 'Test Game 2'),
    ];

    test('should return a list of GameData entities', () async {
      when(mockGameDataObjectBox.values).thenReturn(gameDataObjects);

      final result = await dataSource.getAllGames();

     expect(result, allOf( 
    hasLength(gameDataObjects.length), 
    everyElement(isA<GameData>()),
  ));
    });

    test('should throw LocalException when an error occurs', () async {
      when(mockGameDataObjectBox.values).thenThrow(Exception());

      expect(() => dataSource.getAllGames(), throwsA(isInstanceOf<LocalException>()));
    });
  });

  group('persistDetailGame', () {
    final gameDetailModel = GameDetailModel(id: 1, description: 'Test Description');

    test('should persist game detail when the game detail is not in the box', () async {
      when(mockGameDetailObjectBox.containsKey(1)).thenReturn(false);

      await dataSource.pesistDetailGame(gameDetailModel);

      verifyNever(mockGameDetailObjectBox.put(1, GameDetailObject.fromEntity(gameDetailModel)));
    });

    test('should not persist game detail when the game detail is already in the box', () async {
      when(mockGameDetailObjectBox.containsKey(1)).thenReturn(true);

      expect(() => dataSource.pesistDetailGame(gameDetailModel), throwsA(isInstanceOf<LocalException>()));
    });
  });

  group('getDetailGame', () {
    final gameDetailObject = GameDetailObject(id: 1, description: 'Test Description');

    test('should return a GameDetailModel when the game detail exists in the box', () async {
      when(mockGameDetailObjectBox.get(1)).thenReturn(gameDetailObject);

      final result = await dataSource.getDetailGame(id: 1);

      expect(result, gameDetailObject.toModel());
    });

    test('should return null when the game detail does not exist in the box', () async {
      when(mockGameDetailObjectBox.get(1)).thenReturn(null);

      final result = await dataSource.getDetailGame(id: 1);

      expect(result, isNull);
    });

    test('should throw LocalException when an error occurs', () async {
      when(mockGameDetailObjectBox.get(1)).thenThrow(Exception());

      expect(() => dataSource.getDetailGame(id: 1), throwsA(isInstanceOf<LocalException>()));
    });
  });
}
