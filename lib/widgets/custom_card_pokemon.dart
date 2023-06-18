import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:pokeapi_project/boxes.dart';
import 'package:pokeapi_project/models/pokemon_model.dart';
import 'package:pokeapi_project/utils/extension.dart';

class CustomCardPokemon extends StatelessWidget {
  final PokemonModel pokemon;

  const CustomCardPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                width: 120,
                imageUrl: pokemon.url.getImageUrlFromUrl(),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
              Text(
                pokemon.name.capitalizeFirstLetter(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          ValueListenableBuilder<Box<PokemonModel>>(
            valueListenable: Boxes.getFavorites().listenable(),
            builder: (context, box, widget) {
              bool isFavorite = box.containsKey(pokemon.url);
              return Positioned(
                top: 4,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    isFavorite
                        ? Boxes.removeFavorite(pokemon)
                        : Boxes.addFavorite(pokemon);
                  },
                  icon: isFavorite
                      ? Icon(Icons.favorite,
                          color: Theme.of(context).colorScheme.primary)
                      : Icon(Icons.favorite_outline,
                          color: Theme.of(context).colorScheme.primary),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
