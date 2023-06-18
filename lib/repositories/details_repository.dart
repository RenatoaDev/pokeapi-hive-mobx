import 'package:pokeapi_project/models/evolution_chain_model.dart';
import 'package:pokeapi_project/models/pokemon_details_model.dart';
import 'package:pokeapi_project/models/pokemon_species_model.dart';
import 'package:pokeapi_project/services/api_service.dart';
import 'package:pokeapi_project/utils/strings.dart';

class DetailsRepository {
  final ApiService _apiService;

  DetailsRepository(this._apiService);

  Future<PokemonDetailsModel> fetchPokemon(String url) async {
    try {
      final json = await _apiService.fetchPokemon(url);
      return PokemonDetailsModel.fromJson(json);
    } catch (e) {
      throw Strings.failedToFetchPokemon;
    }
  }

  Future<PokemonSpeciesModel> fetchSpecies(String url) async {
    try {
      final json = await _apiService.fetchSpecies(url);
      return PokemonSpeciesModel.fromJson(json);
    } catch (e) {
      throw Strings.failedToFetchSpecies;
    }
  }

  Future<EvolutionChainModel> fetchEvolutionChain(int id) async {
    try {
      final json = await _apiService.fetchEvolutionChain(id);
      return EvolutionChainModel.fromJson(json['chain']);
    } catch (e) {
      throw Strings.failedToFetchEvolutionChain;
    }
  }
}
