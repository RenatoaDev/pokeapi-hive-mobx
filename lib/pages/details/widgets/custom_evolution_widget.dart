import 'package:flutter/material.dart';
import 'package:pokeapi_project/models/evolution_chain_model.dart';
import 'package:pokeapi_project/models/pokemon_details_model.dart';
import 'package:pokeapi_project/utils/extension.dart';
import 'package:pokeapi_project/utils/strings.dart';

class CustomEvolutionWidget extends StatelessWidget {
  final PokemonDetailsModel pokemonDetails;
  final EvolutionChainModel pokemonEvolution;

  const CustomEvolutionWidget(
      {super.key,
      required this.pokemonDetails,
      required this.pokemonEvolution});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            Strings.evolutionText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Image.network(
                pokemonDetails.sprites.other.officialArtwork.frontDefault,
                fit: BoxFit.contain,
              ),
            ),
            if (pokemonEvolution.evolvesTo.isNotEmpty)
              const Icon(Icons.arrow_forward),
            if (pokemonEvolution.evolvesTo.isNotEmpty)
              Expanded(
                child: Image.network(
                  pokemonEvolution.evolvesTo[0].species.url
                      .getImageUrlFromUrl(),
                  fit: BoxFit.contain,
                ),
              ),
            if (pokemonEvolution.evolvesTo.isNotEmpty &&
                pokemonEvolution.evolvesTo[0].evolvesTo.isNotEmpty)
              const Icon(Icons.arrow_forward),
            if (pokemonEvolution.evolvesTo.isNotEmpty &&
                pokemonEvolution.evolvesTo[0].evolvesTo.isNotEmpty)
              Expanded(
                child: Image.network(
                  pokemonEvolution.evolvesTo[0].evolvesTo[0].species.url
                      .getImageUrlFromUrl(),
                  fit: BoxFit.contain,
                ),
              ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
