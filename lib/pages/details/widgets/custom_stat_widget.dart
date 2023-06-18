import 'package:flutter/material.dart';
import 'package:pokeapi_project/models/pokemon_details_model.dart';
import 'package:pokeapi_project/utils/details_translations.dart';
import 'package:pokeapi_project/utils/extension.dart';
import 'package:pokeapi_project/utils/strings.dart';

class CustomStatWidget extends StatelessWidget {
  final PokemonDetailsModel pokemonDetails;

  const CustomStatWidget({super.key, required this.pokemonDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            Strings.statsText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            pokemonDetails.stats.length,
            (index) {
              final stat = pokemonDetails.stats[index];
              final percentage = (stat.baseStat / 100) * 100;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DetailsTranslations.translateStat(stat.stat.name)
                        .capitalizeFirstLetter(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        stat.baseStat.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 6),
                      SizedBox(
                        width: 170,
                        child: Container(
                          height: 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: LinearProgressIndicator(
                              value: percentage / 100,
                              minHeight: 10,
                              backgroundColor: Colors.grey.shade300,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                percentage < 50
                                    ? Colors.redAccent
                                    : Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
