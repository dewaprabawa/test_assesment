import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/core/extension/text_style_ext.dart';
import 'package:test_assesment/features/domain/entities/genre_entity.dart';
import 'package:test_assesment/features/presentation/creator_cubit/home_creator_cubit.dart';
import 'package:test_assesment/features/presentation/developer_cubit/home_developer_cubit.dart';
import 'package:test_assesment/features/presentation/home_cubit/home_game_cubit.dart';
import 'package:test_assesment/features/presentation/pages/home_detail_page.dart';

class HomeGamePage extends StatelessWidget {
  const HomeGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeGameCubit>();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: GameSearchWidget(cubit));
                },
                icon: Icon(Icons.search_rounded))
          ],
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async =>
              await context.read<HomeGameCubit>().refreshAllGames(),
          child: SingleChildScrollView(
            child: Column(children: [
             GetStartedGameWidget(),
             SizedBox(height: 10,),
             GetCreatorGameWidget(),
             SizedBox(height: 10,),
             GetStartedGameWidget(),
            ],),
          )
        ));
  }
}

class GetStartedGameWidget extends StatelessWidget {
  const GetStartedGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final cubit = context.watch<HomeGameCubit>();
    return switch (cubit.state) {
              HomeGameInitial() => const SizedBox.shrink(),
              HomeGameLoading() => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              HomeGameFailure value => Text(value.message),
              HomeGameLoaded(games: var items) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Text("Get Started").toBoldText(),
                       const  Text("Explore some popular premium games.").toNormalText(color: Colors.grey),
                      ],),
                      IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right_rounded)),
                    ],),
                   const SizedBox(height: 5,),
                    SizedBox(
                      height: 215,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            final bannerURL = item.backgroundImage;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            DetailGamePage(gameId: item.id!)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        CachedNetworkImage(
                                          placeholder: (
                                            context,
                                            url,
                                          ) =>
                                              const Icon(
                                                  Icons.image_aspect_ratio_sharp),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                                  Icons.error_outline_rounded),
                                          imageUrl: bannerURL!,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            height: 120,
                                            width: 200,
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
                                      height: 5,
                                    ),
                                    Row(children: [
                                      Icon(Icons.circle, color: generateRandomColor(), size: 10,),
                                       const SizedBox(
                                      width: 5,
                                    ),
                                      Text(item.name ?? "-").toBoldText()
                                    ],),
                                    Text(item.genres?.toGenreString() ?? "-")
                                        .toNormalText(color: Colors.grey),
                                    Row(children: [
                                      Icon(Icons.videogame_asset_outlined),
                                      const SizedBox(
                                      width: 5,
                                    ),
                                      Text(item.tags?.first.name ?? '-')
                                        .toBoldText(color: Colors.grey),
                                    ],),
                                    Row(
                                      children: [
                                       const Icon(
                                          Icons.star_rate_rounded,
                                          color: Colors.amberAccent,
                                        ),
                                      const  SizedBox(
                                          width: 5,
                                        ),
                                        Text(item.rating.toString())
                                            .toNormalText(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ))
            };
  }

  Color generateRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255, // Alpha (fully opaque)
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
  );
}
}


class GetCreatorGameWidget extends StatelessWidget {
  const GetCreatorGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final cubit = context.watch<HomeCreatorCubit>();
    return switch (cubit.state) {
              HomeCreatorInitial() => const SizedBox.shrink(),
              HomeCreatorLoading() => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              HomeCreatorFailure value => Text(value.message),
              HomeCreatorLoaded(creators: var items) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Text("Get Started").toBoldText(),
                       const  Text("Explore some popular premium games.").toNormalText(color: Colors.grey),
                      ],),
                      IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right_rounded)),
                    ],),
                   const SizedBox(height: 5,),
                    SizedBox(
                      height: 215,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            final bannerURL = item.imageBackground;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            DetailGamePage(gameId: item.id!)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        CachedNetworkImage(
                                          placeholder: (
                                            context,
                                            url,
                                          ) =>
                                              const Icon(
                                                  Icons.image_aspect_ratio_sharp),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                                  Icons.error_outline_rounded),
                                          imageUrl: bannerURL!,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            height: 120,
                                            width: 200,
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
                                      height: 5,
                                    ),
                                    Row(children: [
                                      Icon(Icons.circle, color: generateRandomColor(), size: 10,),
                                       const SizedBox(
                                      width: 5,
                                    ),
                                      Text(item.name ?? "-").toBoldText()
                                    ],),
                                   
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ))
            };
  }

  Color generateRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255, // Alpha (fully opaque)
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
  );
}
}

class GetDeveloperGameWidget extends StatelessWidget {
  const GetDeveloperGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final cubit = context.watch<DeveloperCubit>();
    return switch (cubit.state) {
              DeveloperInitial() => const SizedBox.shrink(),
              DeveloperLoading() => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              DeveloperFailure value => Text(value.message),
              DeveloperLoaded(developers: var items) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Text("Get Started").toBoldText(),
                       const  Text("Explore some popular premium games.").toNormalText(color: Colors.grey),
                      ],),
                      IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right_rounded)),
                    ],),
                   const SizedBox(height: 5,),
                    SizedBox(
                      height: 215,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            final bannerURL = item.imageBackground;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            DetailGamePage(gameId: item.id!)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        CachedNetworkImage(
                                          placeholder: (
                                            context,
                                            url,
                                          ) =>
                                              const Icon(
                                                  Icons.image_aspect_ratio_sharp),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                                  Icons.error_outline_rounded),
                                          imageUrl: bannerURL!,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            height: 120,
                                            width: 200,
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
                                      height: 5,
                                    ),
                                    Row(children: [
                                      Icon(Icons.circle, color: generateRandomColor(), size: 10,),
                                       const SizedBox(
                                      width: 5,
                                    ),
                                      Text(item.name ?? "-").toBoldText()
                                    ],),
                                   
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ))
            };
  }

  Color generateRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255, // Alpha (fully opaque)
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
  );
}
}


class GameSearchWidget extends SearchDelegate {
  final HomeGameCubit
      homeGameCubit; // Assuming you have a reference to your HomeGameCubit

  GameSearchWidget(this.homeGameCubit);

  @override
  List<Widget> buildActions(BuildContext context) {
    // These are the actions to be displayed on the right side of the search bar.
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query.
          homeGameCubit.getAllGames();
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // This is the leading icon on the left side of the search bar.
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search bar.
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    homeGameCubit.searchGames(query);
    return BlocBuilder<HomeGameCubit, HomeGameState>(
      builder: (context, state) {
        if (state is HomeGameLoaded) {
          final gameList = state.games;
          return ListView.builder(
            itemCount: gameList.length,
            itemBuilder: (context, index) {
              final game = gameList[index];
              // Build and return the game item widget.
              return ListTile(
                title: Text(game.name ?? ""),
                // Other game information can be displayed here.
              );
            },
          );
        } else if (state is HomeGameLoading) {
          return const CircularProgressIndicator.adaptive();
        } else if (state is HomeGameFailure) {
          return Text(state.message);
        } else {
          return Container(); // Handle other states as needed.
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final homeGameCubit =
        context.read<HomeGameCubit>(); // Get the HomeGameCubit instance

    return BlocBuilder<HomeGameCubit, HomeGameState>(
      builder: (context, state) {
        if (state is HomeGameLoaded) {
          final gameList = state.games;

          // Filter and display search suggestions based on the query.
          final filteredSuggestions = gameList
              .where((game) =>
                  game.name!.toLowerCase().contains(query.toLowerCase()))
              .toList();

          return ListView.builder(
            itemCount: filteredSuggestions.length,
            itemBuilder: (context, index) {
              final suggestion = filteredSuggestions[index].name;
              return ListTile(
                title: Text(suggestion ?? ""),
                onTap: () {
                  // When a suggestion is tapped, update the search query and
                  // trigger the search using your BLoC's searchGames method.
                  query = suggestion ?? "";
                  homeGameCubit.searchGames(query);
                  // Optionally, close the suggestions list.
                  close(context, null);
                },
              );
            },
          );
        } else {
          return Container(); // Handle other states if needed.
        }
      },
    );
  }
}
