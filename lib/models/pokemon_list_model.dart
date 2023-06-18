import 'package:pokeapi_project/models/pokemon_model.dart';

class PokemonListModel {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonModel> results;

  PokemonListModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> resultsJson = json['results'];

    final List<PokemonModel> results = resultsJson.map((result) {
      return PokemonModel.fromJson(result);
    }).toList();

    return PokemonListModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: results,
    );
  }
}
