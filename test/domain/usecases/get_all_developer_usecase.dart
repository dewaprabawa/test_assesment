import 'package:test_assesment/core/common/usecase.dart';
import 'package:test_assesment/features/domain/entities/developer_game_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';
import 'package:test_assesment/features/domain/usecases/get_all_developer_usecase.dart'; 

import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  late GetAllDeveloperUsecase getAllDeveloperUsecase;
  late MockGameRepository mockRepository;

  setUp(() {
    mockRepository = MockGameRepository();
    getAllDeveloperUsecase = GetAllDeveloperUsecase(mockRepository);
  });

  group('GetAllDeveloperUsecase', () {
    test('should return a DeveloperDataEntity when the repository returns data', () async {
      // Arrange
      final expectedDeveloperDataEntity = DeveloperDataEntity();
      when(() => mockRepository.getAllDevelopers(page: any(named: 'page')))
          .thenAnswer((_) async => expectedDeveloperDataEntity);

      // Act
      final result = await getAllDeveloperUsecase.call('page_parameter');

      // Assert
      expect(result, equals(expectedDeveloperDataEntity));
      verify(() => mockRepository.getAllDevelopers(page: 'page_parameter')).called(1);
    });

    test('should return null when the repository returns null', () async {
      // Arrange
      when(() => mockRepository.getAllDevelopers(page: any(named: 'page')))
          .thenAnswer((_) async => null);

      // Act
      final result = await getAllDeveloperUsecase.call('page_parameter');

      // Assert
      expect(result, isNull);
      verify(() => mockRepository.getAllDevelopers(page: 'page_parameter')).called(1);
    });
  });
}
