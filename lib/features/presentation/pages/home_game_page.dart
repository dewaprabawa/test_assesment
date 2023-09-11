import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/core/extension/text_style_ext.dart';
import 'package:test_assesment/features/presentation/export_blocs.dart';
import 'package:test_assesment/features/presentation/export_widgets.dart';

class HomeGamePage extends StatelessWidget {
  const HomeGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Game Gallery").toBoldText(),
          centerTitle: false,
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<HomeGameCubit, HomeGameState>(
                listener: (context, state) {
              if (state is HomeGameFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message).toNormalText()));
              }
            }),
            BlocListener<DeveloperCubit, DeveloperState>(
                listener: (context, state) {
              if (state.stateEnum == DeveloperStateStatus.Failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message ?? "-").toNormalText()));
              }
            }),
            BlocListener<HomeCreatorCubit, HomeCreatorState>(
                listener: (context, state) {
              if (state.stateEnum == CreatorStateStatus.Failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message ?? "-").toNormalText()));
              }
            })
          ],
          child: RefreshIndicator.adaptive(
            onRefresh: () async {
              await context.read<HomeGameCubit>().refreshAllGames();
              await context.read<DeveloperCubit>().getDeveloperGames();
              await context.read<HomeCreatorCubit>().getCreatorGames();
            },
            child: const SingleChildScrollView(
              child:  Column(
                children: [
                  GetStartedGameWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  GetCreatorGameWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  GetDeveloperGameWidget(),
                ],
              ),
            ),
          ),
        ));
  }
}
