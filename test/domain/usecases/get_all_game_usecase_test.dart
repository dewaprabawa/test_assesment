import 'package:mockito/annotations.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';
import 'package:test_assesment/features/domain/usecases/get_all_game_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';


class MockGameRepository extends Mock implements GameRepository {}

void main() {
  late GetAllGameUsecase getAllGameUsecase;
  late MockGameRepository mockRepository;

  setUp(() {
    mockRepository = MockGameRepository();
    getAllGameUsecase = GetAllGameUsecase(mockRepository);
  });

 group('GetAllGameUsecase', () {
    test('should return a GameEntity when the repository returns data', () async {
      // Arrange
      final expectedGameEntity = GameEntity();
      when(() => mockRepository.getAllGames(page: any(named: 'page')))
          .thenAnswer((_) async => expectedGameEntity);

      // Act
      final result = await getAllGameUsecase.call('page_parameter');

      // Assert
      expect(result, equals(expectedGameEntity));
      verify(() => mockRepository.getAllGames(page: 'page_parameter')).called(1);
       verifyNoMoreInteractions(mockRepository);
    });

    test('should return null when the repository returns null', () async {
      // Arrange
      when(() => mockRepository.getAllGames(page: "1"))
          .thenAnswer((_) async => null);

      // Act
      final result = await getAllGameUsecase.call( "1");

      // Assert
      expect(result, null);
      verify(() => mockRepository.getAllGames(page: "1")).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
