import 'package:test_assesment/core/common/usecase.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/domain/entities/game_detail_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';
import 'package:test_assesment/features/domain/usecases/get_detail_game_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  late GetDetailGameUsecase getDetailGameUsecase;
  late MockGameRepository mockRepository;

  setUp(() {
    mockRepository = MockGameRepository();
    getDetailGameUsecase = GetDetailGameUsecase(mockRepository);
  });

  group('GetDetailGameUsecase', () {
    test('should return a GameDetailEntity when connected to the network', () async {
      // Arrange
      final expectedGameDetailEntity = GameDetailEntity();
      when(() => mockRepository.getDetailGame(id: any(named: 'id')))
          .thenAnswer((_) async => expectedGameDetailEntity);

      // Act
      final result = await getDetailGameUsecase.call(123); 

      // Assert
      expect(result, equals(expectedGameDetailEntity));
      verify(() => mockRepository.getDetailGame(id: 123)).called(1);
    });

    test('should return a GameDetailEntity from local storage when not connected to the network', () async {
      // Arrange
    
      when(() => mockRepository.getDetailGame(id: any(named: 'id')))
          .thenAnswer((_) async => null); // Simulate network failure


      // Act
      final result = await getDetailGameUsecase.call(123); 

      // Assert
      expect(result, equals(null));
      verify(() => mockRepository.getDetailGame(id: 123)).called(1);
    });

    test('should throw a LocalException when both network and local storage fail', () async {
      // Arrange
      when(() => mockRepository.getDetailGame(id: any(named: 'id')))
          .thenThrow(LocalException()); // Simulate network failure
      // Act
      Future<void> call() async {
        await getDetailGameUsecase.call(123); // Provide an ID here
      }

      // Assert
      expect(call, throwsA(isA<LocalException>()));
      verify(() => mockRepository.getDetailGame(id: 123)).called(1);
    });
  });
}
