import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/features/presentation/home_cubit/home_game_cubit.dart';


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
