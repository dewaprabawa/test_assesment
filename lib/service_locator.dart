import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_assesment/features/data/data_sources/locale/game_local_data_source.dart';
import 'package:test_assesment/features/data/data_sources/locale/objects/15_creator_data_object.dart';
import 'package:test_assesment/features/data/data_sources/remote/game_remote_data_source.dart';
import 'package:test_assesment/features/data/repositories/game_repository_impl.dart';
import 'package:test_assesment/features/domain/repositories/game_repository.dart';
import 'package:test_assesment/features/domain/usecases/get_all_creator_usecase.dart';
import 'package:test_assesment/features/domain/usecases/get_detail_game_local_usecase.dart';
import 'package:test_assesment/features/presentation/creator_cubit/home_creator_cubit.dart';
import 'package:test_assesment/features/presentation/detail_cubit/detail_game_cubit.dart';
import 'package:test_assesment/features/presentation/developer_cubit/home_developer_cubit.dart';

import 'core/export_common.dart';
import 'core/request/base_client.dart';
import 'features/data/data_sources/locale/export_object.dart';
import 'features/domain/export_usecases.dart';
import 'features/domain/usecases/get_all_developer_usecase.dart';
import 'features/presentation/home_cubit/home_game_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> take() async {
    sl.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker.createInstance());
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
    sl.registerLazySingleton<Dio>(() => Dio());

    sl.registerLazySingleton<BaseClient>(() => BaseRequestImpl(sl()));

    sl.registerLazySingleton<GameRemoteDataSource>(
        () => GameRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<GameLocalDataSource>(() => GameLocalDataSourceImpl(
        Hive.box<GameDataObject>(PathURLconstants.GAME_DATA_KEY),
        Hive.box<GameDetailObject>(PathURLconstants.GAME_DETAIL_KEY),
        Hive.box<CreatorDataObject>(PathURLconstants.CREATOR_DATA_KEY)));

    sl.registerLazySingleton<GameRepository>(
        () => GameRepositoryImpl(sl(), sl(), sl()));

    sl.registerFactory(() => HomeGameCubit(sl(), sl()));
    sl.registerFactory(() => DetailGameCubit(sl(), sl()));
    sl.registerFactory(() => HomeCreatorCubit(sl()));
    sl.registerFactory(() => DeveloperCubit(sl()));

    sl.registerLazySingleton(() => GetAllDeveloperUsecase(sl()));
    sl.registerLazySingleton(() => GetAllCreatorUsecase(sl()));
    sl.registerLazySingleton(() => GetAllGameUsecase(sl()));
    sl.registerLazySingleton(() => SearchGameUsecase(sl()));
    sl.registerLazySingleton(() => GetDetailGameUsecase(sl()));
    sl.registerLazySingleton(() => GetDetailGameLocalUsecase(sl()));
  }
}
