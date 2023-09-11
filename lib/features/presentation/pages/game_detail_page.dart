import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/core/extension/text_style_ext.dart';
import 'package:test_assesment/features/presentation/detail_cubit/detail_game_cubit.dart';

class GameDetailPage extends StatefulWidget {
  final int gameId;
  final String? title;

  const GameDetailPage({Key? key, required this.gameId, this.title})
      : super(key: key);

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailGameCubit>().getDetailGame(widget.gameId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailGameCubit, DetailGameState>(
      listener: (context, state) {
        if (state is DetailGameFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message).toNormalText()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title ?? "-").toBoldText(),
          ),
          bottomNavigationBar: Container(
            height: 100,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(140, 45)),
                  onPressed: () {},
                  child: const Text("Buy Now").toBoldText(),
                ),
              ],
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(DetailGameState state) {
    switch (state.runtimeType) {
      case DetailGameInitial:
        return const SizedBox();
      case DetailGameLoading:
        return const Center(child: CircularProgressIndicator.adaptive());
      case DetailGameFailure:
        return Center(child: Text((state as DetailGameFailure).message));
      case DetailGameLoaded:
        final item = (state as DetailGameLoaded).detailGame;
        return SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGameImage(item.backgroundImage),
                  const SizedBox(height: 10),
                  _buildGameInfo(item),
                  const SizedBox(height: 10),
                  _buildOverview(item.description),
                ],
              ),
            ),
          ),
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildGameImage(String? imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? "-",
      imageBuilder: (context, imageProvider) => Container(
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildGameInfo(var item) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: item.backgroundImageAdditional ?? "-",
          imageBuilder: (context, imageProvider) => Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name ?? "-").toBoldText(),
            Text(item.updated?.toIso8601String() ?? "-")
                .toSemiBoldText(color: Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget _buildOverview(String? description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const Text("Overview").toBoldText(),
        Text(description ?? '-').toLightText(),
      ],
    );
  }
}
