import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';
import 'package:test_assesment/features/domain/usecases/get_all_game_usecase.dart';
import 'package:test_assesment/core/error/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_assesment/features/presentation/home_cubit/home_game_cubit.dart';
import 'home_game_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetAllGameUsecase>()])
void main() {
  group('HomeGameCubit', () {
    late HomeGameCubit homeGameCubit;
    late MockGetAllGameUsecase mockGetAllGameUsecase;

    setUp(() {
      mockGetAllGameUsecase = MockGetAllGameUsecase();
      homeGameCubit = HomeGameCubit(mockGetAllGameUsecase);
    });

    tearDown(() {
      homeGameCubit.close();
    });

    test('initial state is HomeGameInitial', () {
      expect(homeGameCubit.state, equals(HomeGameInitial()));
    });

    blocTest<HomeGameCubit, HomeGameState>(
      'emits [HomeGameLoaded] when GetAllGameUsecase succeeds',
      build: () {
        when(() => mockGetAllGameUsecase.call(any)).thenAnswer(
          (_) async => GameEntity(results: [GameData()]),
        );
        return homeGameCubit;
      },
      act: (cubit) => cubit.getAllGames(),
      expect: () => [HomeGameLoaded([GameData()])],
    );

    blocTest<HomeGameCubit, HomeGameState>(
      'emits [HomeGameFailure] when GetAllGameUsecase throws ServerException',
      build: () {
        when(() => mockGetAllGameUsecase.call(any)).thenThrow(ServerException());
        return homeGameCubit;
      },
      act: (cubit) => cubit.getAllGames(),
      expect: () => [HomeGameFailure("An error occurred when requesting data.")],
    );

    blocTest<HomeGameCubit, HomeGameState>(
      'emits [HomeGameFailure] when GetAllGameUsecase throws SocketException',
      build: () {
        when(() => mockGetAllGameUsecase.call(any)).thenThrow(SocketException());
        return homeGameCubit;
      },
      act: (cubit) => cubit.getAllGames(),
      expect: () => [HomeGameFailure("Your device is not connected to the internet.")],
    );
  });
}
