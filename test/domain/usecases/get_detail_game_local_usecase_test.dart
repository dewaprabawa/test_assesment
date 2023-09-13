import 'package:test_assesment/core/error/exceptions.dart';
import 'package:test_assesment/features/domain/entities/game_detail_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';
import 'package:test_assesment/features/domain/usecases/get_detail_game_local_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  late GetDetailGameLocalUsecase getDetailGameLocalUsecase;
  late MockGameRepository mockRepository;

  setUp(() {
    mockRepository = MockGameRepository();
    getDetailGameLocalUsecase = GetDetailGameLocalUsecase(mockRepository);
  });

  group('GetDetailGameLocalUsecase', () {
    test('should return a GameDetailEntity from local storage', () async {
      // Arrange
      final expectedGameDetailEntity = GameDetailEntity();
      when(() => mockRepository.getDetailGameLocal(id: any(named: 'id')))
          .thenAnswer((_) async => expectedGameDetailEntity);

      // Act
      final result = await getDetailGameLocalUsecase.call(123); // Provide an ID here

      // Assert
      expect(result, equals(expectedGameDetailEntity));
      verify(() => mockRepository.getDetailGameLocal(id: 123)).called(1);
    });

    test('should throw a LocalException when local storage fails', () async {
      // Arrange
      when(() => mockRepository.getDetailGameLocal(id: any(named: 'id')))
          .thenThrow(LocalException()); 

      // Act
      Future<void> call() async {
        await getDetailGameLocalUsecase.call(123); // Provide an ID here
      }

      // Assert
      expect(call, throwsA(isA<LocalException>()));
      verify(() => mockRepository.getDetailGameLocal(id: 123)).called(1);
    });
  });
}
