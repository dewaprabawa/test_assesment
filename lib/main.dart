import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/features/presentation/detail_cubit/detail_game_cubit.dart';
import 'package:test_assesment/features/presentation/developer_cubit/home_developer_cubit.dart';
import 'package:test_assesment/features/presentation/home_cubit/home_game_cubit.dart';
import 'package:test_assesment/features/presentation/pages/home_game_page.dart';
import 'package:test_assesment/service_locator.dart';
import 'core/hive_setup/hive_setup.dart';
import 'features/presentation/creator_cubit/home_creator_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveSetupDB.init();
  await ServiceLocator.take();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeGameCubit>()..getAllGames()),
        BlocProvider(create: (context) => sl<DetailGameCubit>()),
        BlocProvider(
            create: (context) => sl<HomeCreatorCubit>()..getCreatorGames()),
        BlocProvider(
            create: (context) => sl<DeveloperCubit>()..getDeveloperGames())
      ],
      child: MaterialApp(
        title: 'Super Ultra',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: true,
        ),
        home: const App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeGamePage(),
    );
  }
}
