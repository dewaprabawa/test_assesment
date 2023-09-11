import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/core/extension/text_style_ext.dart';
import 'package:test_assesment/features/domain/entities/developer_game_entity.dart';
import 'package:test_assesment/features/presentation/developer_cubit/home_developer_cubit.dart';
import 'package:test_assesment/features/presentation/pages/home_detail_page.dart';
import 'package:test_assesment/features/presentation/widgets/content_developer_list_widget.dart';

class GetDeveloperGameWidget extends StatelessWidget {
  const GetDeveloperGameWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DeveloperCubit>();
    return _buildContent(context, cubit.state);
  }

  Widget _buildContent(BuildContext context, DeveloperState state) {
    switch (state) {
      case DeveloperInitial():
        return const SizedBox.shrink();
      case DeveloperLoading():
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      case DeveloperFailure value:
        return Text(value.message);
      case DeveloperLoaded(developers: var items):
        return _buildLoadedContent(context, items);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildLoadedContent(BuildContext context, List<DeveloperData> items) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 5),
          _buildDeveloperList(context, items),
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
            const Text("Find dedicated developer").toBoldText(),
            const Text("Explore some more experiences.")
                .toNormalText(color: Colors.grey),
          ],
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ContentDeveloperListWidget(),
              ),
            );
          },
          icon: Icon(Icons.chevron_right_rounded),
        ),
      ],
    );
  }

  Widget _buildDeveloperList(BuildContext context, List<DeveloperData> items) {
    return SizedBox(
      height: 215,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildDeveloperItem(context, item);
        },
      ),
    );
  }

  Widget _buildDeveloperItem(BuildContext context, DeveloperData item) {
    final bannerURL = item.imageBackground;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => DetailGamePage(gameId: item.id!),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDeveloperImage(bannerURL),
            const SizedBox(
              height: 5,
            ),
            _buildDeveloperInfo(item),
          ],
        ),
      ),
    );
  }

  Widget _buildDeveloperImage(String? bannerURL) {
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

  Widget _buildDeveloperInfo(DeveloperData item) {
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
              Icons.videogame_asset_outlined,
              color: generateRandomColor(),
              size: 20,
            ),
            const SizedBox(width: 5),
            Text(item.games?.first.name ?? "-").toBoldText(),
          ],
        ),
      ],
    );
  }
}
