import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokeapi_project/boxes.dart';
import 'package:pokeapi_project/models/pokemon_model.dart';
import 'package:pokeapi_project/pages/details/details_view.dart';
import 'package:pokeapi_project/utils/strings.dart';
import 'package:pokeapi_project/widgets/custom_card_pokemon.dart';
import 'package:pokeapi_project/widgets/custom_scaffold.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Strings.favoritesTitle,
      body: ValueListenableBuilder<Box<PokemonModel>>(
        valueListenable: Boxes.getFavorites().listenable(),
        builder: (context, box, widget) {
          final favorites = box.values.toList().cast<PokemonModel>();
          favorites.sort((a, b) => a.addedDate.compareTo(b.addedDate));

          if (favorites.isEmpty) {
            return Center(
              child: Text(
                Strings.noFavoritePokemonText,
                style: TextStyle(color: Colors.grey.shade700),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final pokemon = favorites[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsView(pokemonUrl: pokemon.url),
                      ),
                    );
                  },
                  child: CustomCardPokemon(pokemon: pokemon),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
