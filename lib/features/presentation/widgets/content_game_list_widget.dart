import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/core/extension/text_style_ext.dart';
import 'package:test_assesment/features/domain/entities/genre_entity.dart';
import '../pages/home_detail_page.dart';
import '../export_widgets.dart';
import 'package:test_assesment/features/presentation/export_blocs.dart';

class ContentGameListWidget extends StatefulWidget {
  const ContentGameListWidget({super.key});

  @override
  State<ContentGameListWidget> createState() => _ContentGameListWidgetState();
}

class _ContentGameListWidgetState extends State<ContentGameListWidget> {
  ScrollController _scrollController = ScrollController();

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
      context.read<HomeGameCubit>().getGamesByPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeGameCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Started").toBoldText(),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: GameSearchWidget(cubit));
              },
              icon: Icon(Icons.search_rounded))
        ],
      ),
      body: BlocConsumer<HomeGameCubit, HomeGameState>(listener: (context, state){

      },
      builder: (context, state) {
       return switch (cubit.state) {
        HomeGameInitial() => const SizedBox.shrink(),
        HomeGameLoading() => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        HomeGameFailure value => Text(value.message),
        HomeGameLoaded(games: var items) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Explore some popular premium games.")
                            .toNormalText(color: Colors.grey),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: NotificationListener(
                    onNotification: (notification) {
                      // Check if the user has scrolled to the bottom of the list.
                      if (notification is ScrollEndNotification &&
                          _scrollController.position.extentAfter == 0) {
                        context.read<HomeGameCubit>().getGamesByPage();
                        print("load");
                      }
                      return true;
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          final bannerURL = item.backgroundImage;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Colors.grey.shade200))),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => DetailGamePage(
                                              gameId: item.id!,
                                              title: item.name,
                                            )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        CachedNetworkImage(
                                          placeholder: (
                                            context,
                                            url,
                                          ) =>
                                              const Icon(Icons
                                                  .image_aspect_ratio_sharp),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                                  Icons.error_outline_rounded),
                                          imageUrl: bannerURL!,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            height: 80,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Wrap(
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: generateRandomColor(),
                                                size: 10,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(item.name ?? "-")
                                                  .toBoldText()
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
                                              Text(item.rating.toString())
                                                  .toNormalText(),
                                            ],
                                          ),
                                          Text(item.genres?.toGenreString() ??
                                                  "-")
                                              .toNormalText(color: Colors.grey),
                                          Row(
                                            children: [
                                              const Icon(Icons
                                                  .videogame_asset_outlined),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(item.tags?.first.name ?? '-')
                                                  .toBoldText(
                                                      color: Colors.grey),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      DetailGamePage(
                                                        gameId: item.id!,
                                                        title: item.name,
                                                      )));
                                        },
                                        icon: const Icon(
                                            Icons.chevron_right_rounded))
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ))
      };
      },
      )
    );
  }

}

