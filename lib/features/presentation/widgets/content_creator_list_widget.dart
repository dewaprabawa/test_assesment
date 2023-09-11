import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/core/extension/text_style_ext.dart';
import 'package:test_assesment/features/domain/entities/creator_entity.dart';
import 'package:test_assesment/features/presentation/export_blocs.dart';
import '../pages/home_detail_page.dart';

class ContentCreatorListWidget extends StatefulWidget {
  const ContentCreatorListWidget({Key? key});

  @override
  State<ContentCreatorListWidget> createState() =>
      _ContentCreatorListWidgetState();
}

class _ContentCreatorListWidgetState extends State<ContentCreatorListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<HomeCreatorCubit>().getCreatorsByPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCreatorCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Game Creator").toBoldText(),
        centerTitle: false,
      ),
      body: BlocConsumer<HomeCreatorCubit, HomeCreatorState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildContent(context, cubit, state);
        },
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, HomeCreatorCubit cubit, HomeCreatorState state) {
    switch (state.runtimeType) {
      case HomeCreatorInitial:
        return const SizedBox.shrink();
      case HomeCreatorLoading:
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      case HomeCreatorFailure:
        final failureState = state as HomeCreatorFailure;
        return Text(failureState.message);
      case HomeCreatorLoaded:
        final loadedState = state as HomeCreatorLoaded;
        return _buildLoadedContent(context, cubit, loadedState.creators);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildLoadedContent(
      BuildContext context, HomeCreatorCubit cubit, List<CreatorData> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 10),
          Expanded(
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification &&
                    _scrollController.position.extentAfter == 0) {
                  cubit.getCreatorsByPage();
                }
                return true;
              },
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final bannerURL = item.image;
                  return _buildCreatorItem(context, item, bannerURL);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Visit some of their best games.")
                .toNormalText(color: Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget _buildCreatorItem(
      BuildContext context, CreatorData item, String? bannerURL) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade200),
        ),
      ),
      child: InkWell(
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCreatorImage(bannerURL),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
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
                        const Text("Game Released -").toNormalText(),
                        Text(item.gamesCount.toString() ?? "-")
                            .toBoldText(),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
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
            height: 80,
            width: 100,
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
}
