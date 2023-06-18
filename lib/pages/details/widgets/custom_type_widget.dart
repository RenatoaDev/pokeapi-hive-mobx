import 'package:flutter/material.dart';
import 'package:pokeapi_project/models/pokemon_details_model.dart';
import 'package:pokeapi_project/utils/details_translations.dart';

class CustomTypeWidget extends StatelessWidget {
  final PokemonDetailsModel pokemonDetails;
  const CustomTypeWidget({
    super.key,
    required this.pokemonDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(pokemonDetails.types.length, (index) {
          final type = pokemonDetails.types[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                DetailsTranslations.translateType(type.type.name),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
