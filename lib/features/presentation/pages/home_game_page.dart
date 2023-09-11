import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/core/extension/text_style_ext.dart';
import 'package:test_assesment/features/presentation/creator_cubit/home_creator_cubit.dart';
import 'package:test_assesment/features/presentation/developer_cubit/home_developer_cubit.dart';
import 'package:test_assesment/features/presentation/home_cubit/home_game_cubit.dart';
import 'package:test_assesment/features/presentation/widgets/get_creator_game_widget.dart';
import 'package:test_assesment/features/presentation/widgets/get_developer_game_widget.dart';
import 'package:test_assesment/features/presentation/widgets/get_started_game_widget.dart';

class HomeGamePage extends StatelessWidget {
  const HomeGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         title: const Text("Game Gallery").toBoldText(),
         centerTitle: false,
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {
            await context.read<HomeGameCubit>().refreshAllGames();
            await context.read<DeveloperCubit>().getDeveloperGames();
            await context.read<HomeCreatorCubit>().getCreatorGames();
          },
          child: const SingleChildScrollView(
            child: Column(children: [
             GetStartedGameWidget(),
             SizedBox(height: 10,),
             GetCreatorGameWidget(),
             SizedBox(height: 10,),
             GetDeveloperGameWidget(),
            ],),
          )
        ));
  }
}


