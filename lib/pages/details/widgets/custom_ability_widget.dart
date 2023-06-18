import 'package:flutter/material.dart';
import 'package:pokeapi_project/models/pokemon_details_model.dart';
import 'package:pokeapi_project/utils/ability_translations.dart';
import 'package:pokeapi_project/utils/strings.dart';

class CustomAbilityWidget extends StatelessWidget {
  final PokemonDetailsModel pokemonDetails;

  const CustomAbilityWidget({super.key, required this.pokemonDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            Strings.abilityText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          color: Colors.grey.shade100,
          child: Column(
            children: [
              Column(
                children:
                    List.generate(pokemonDetails.abilities.length, (index) {
                  final abilities = pokemonDetails.abilities[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          AbilityTranslations.translateAbility(
                              abilities.ability.name),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey.shade600,
                      )
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
