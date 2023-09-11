import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/core/extension/text_style_ext.dart';
import 'package:test_assesment/features/domain/entities/creator_entity.dart';
import 'package:test_assesment/features/presentation/creator_cubit/home_creator_cubit.dart';
import 'package:test_assesment/features/presentation/widgets/content_creator_list_widget.dart';


class GetCreatorGameWidget extends StatelessWidget {
  const GetCreatorGameWidget({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCreatorCubit>();
    return _buildContent(context, cubit.state);
  }

  Widget _buildContent(BuildContext context, HomeCreatorState state) {
    switch (state.stateEnum) {
      case CreatorStateStatus.Initial:
        return const SizedBox.shrink();
      case CreatorStateStatus.Loading:
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      case CreatorStateStatus.Failure:
        return _buildErrorState(context, state.message ?? "-");
      case CreatorStateStatus.Loaded:
        return _buildLoadedContent(context, state.creators ?? []);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildLoadedContent(BuildContext context, List<CreatorData> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 5),
          _buildCreatorList(context, items),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String value){
    return Column(
          children: [
            Text(value).toBoldText(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                maximumSize: const Size(200, 60)
              ),
              onPressed: (){
              context.read<HomeCreatorCubit>().getCreatorGames();
            }, child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Icon(Icons.replay_outlined),
              const Text("Reload").toBoldText()
            ],))
          ],
        );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Popular Game Creator").toBoldText(),
            const Text("Visit some of their best creations.")
                .toNormalText(color: Colors.grey),
          ],
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ContentCreatorListWidget(),
              ),
            );
          },
          icon: Icon(Icons.chevron_right_rounded),
        ),
      ],
    );
  }

  Widget _buildCreatorList(BuildContext context, List<CreatorData> items) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildCreatorItem(context, item);
        },
      ),
    );
  }

  Widget _buildCreatorItem(BuildContext context, CreatorData item) {
    final bannerURL = item.image;
    return InkWell(
      onTap: () {
         Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ContentCreatorListWidget(),
              ),
            );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCreatorImage(bannerURL),
            const SizedBox(
              height: 5,
            ),
            _buildCreatorInfo(item),
          ],
        ),
      ),
    );
  }

  Widget _buildCreatorImage(String? bannerURL) {
    return Stack(
      children: [
        CachedNetworkImage(
          placeholder: (context, url) =>
              const Icon(Icons.image_aspect_ratio_sharp),
          errorWidget: (context, url, error) =>
              const Icon(Icons.error_outline_rounded),
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

  Widget _buildCreatorInfo(CreatorData item) {
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
        Row(
          children: [
            Icon(
              Icons.games_rounded,
              color: generateRandomColor(),
              size: 10,
            ),
            const SizedBox(width: 5),
            Text("Game Released -").toNormalText(),
            Text(item.gamesCount.toString() ?? "-").toBoldText(),
          ],
        ),
      ],
    );
  }
}
