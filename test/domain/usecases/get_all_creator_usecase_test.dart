import 'package:test_assesment/features/domain/entities/creator_entity.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';
import 'package:test_assesment/features/domain/usecases/get_all_creator_usecase.dart';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  late GetAllCreatorUsecase getAllCreatorUsecase;
  late MockGameRepository mockRepository;

  setUp(() {
    mockRepository = MockGameRepository();
    getAllCreatorUsecase = GetAllCreatorUsecase(mockRepository);
  });

  group('GetAllCreatorUsecase', () {
    test('should return a CreatorEntity when the repository returns data', () async {
      // Arrange
      final expectedCreatorEntity = CreatorEntity();
      when(() => mockRepository.getAllCreators(page: any(named: 'page')))
          .thenAnswer((_) async => expectedCreatorEntity);

      // Act
      final result = await getAllCreatorUsecase.call('page_parameter');

      // Assert
      expect(result, equals(expectedCreatorEntity));
      verify(() => mockRepository.getAllCreators(page: 'page_parameter')).called(1);
    });

    test('should return null when the repository returns null', () async {
      // Arrange
      when(() => mockRepository.getAllCreators(page: any(named: 'page')))
          .thenAnswer((_) async => null);

      // Act
      final result = await getAllCreatorUsecase.call('page_parameter');

      // Assert
      expect(result, isNull);
      verify(() => mockRepository.getAllCreators(page: 'page_parameter')).called(1);
    });
  });
}
