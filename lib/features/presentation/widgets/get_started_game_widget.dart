import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:test_assesment/core/extension/text_style_ext.dart';
import 'package:test_assesment/features/domain/entities/game_data_entity.dart';
import 'package:test_assesment/features/presentation/home_cubit/home_game_cubit.dart';
import 'package:test_assesment/features/presentation/widgets/content_game_list_widget.dart';
import 'package:test_assesment/features/domain/entities/genre_entity.dart';
import '../pages/home_detail_page.dart';

class GetStartedGameWidget extends StatelessWidget {
  const GetStartedGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeGameCubit>();
    
    return _buildContent(context, cubit.state);
  }

  Widget _buildContent(BuildContext context, HomeGameState state) {
    switch (state) {
      case HomeGameInitial():
        return const SizedBox.shrink();
      case HomeGameLoading():
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      case HomeGameFailure value:
        return Text(value.message);
      case HomeGameLoaded(games: var items):
        return _buildLoadedContent(context,items);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildLoadedContent(BuildContext context, List<GameData> items) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 5),
          _buildGameList(context, items),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Get Started").toBoldText(),
            const Text("Explore some popular premium games.")
                .toNormalText(color: Colors.grey),
          ],
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ContentGameListWidget(),
              ),
            );
          },
          icon: Icon(Icons.chevron_right_rounded),
        ),
      ],
    );
  }

  Widget _buildGameList(BuildContext context, List<GameData> items) {
    return SizedBox(
      height: 215,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildGameItem(context,item);
        },
      ),
    );
  }

  Widget _buildGameItem(BuildContext context, GameData item) {
    final bannerURL = item.backgroundImage;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => DetailGamePage(
              gameId: item.id!,
              title: item.name,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGameImage(bannerURL),
            const SizedBox(height: 5),
            _buildGameInfo(context, item),
          ],
        ),
      ),
    );
  }

  Widget _buildGameImage(String? bannerURL) {
    return Stack(
      children: [
        CachedNetworkImage(
          placeholder: (context, url) => const Icon(
            Icons.image_aspect_ratio_sharp,
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error_outline_rounded,
          ),
          imageUrl: bannerURL!,
          imageBuilder: (context, imageProvider) => Container(
            height: 120,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGameInfo(BuildContext context, GameData item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.circle,
              color: generateRandomColor(),
              size: 10,
            ),
            const SizedBox(width: 5),
            Text(item.name ?? "-").toBoldText(),
          ],
        ),
        Text(item.genres?.toGenreString() ?? "-").toNormalText(color: Colors.grey),
        Row(
          children: [
            Icon(
              Icons.videogame_asset_outlined,
            ),
            const SizedBox(width: 5),
            Text(item.tags?.first.name ?? '-').toBoldText(color: Colors.grey),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.star_rate_rounded,
              color: Colors.amberAccent,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(item.rating.toString()).toNormalText(),
          ],
        ),
      ],
    );
  }
}
