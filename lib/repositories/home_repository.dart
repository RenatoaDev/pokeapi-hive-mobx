import 'package:pokeapi_project/models/pokemon_list_model.dart';
import 'package:pokeapi_project/services/api_service.dart';
import 'package:pokeapi_project/utils/strings.dart';

class HomeRepository {
  final ApiService _apiService;

  HomeRepository(this._apiService);

  Future<PokemonListModel?>? fetchPokemons(String? url) async {
    try {
      final json = await _apiService.fetchPokemons(url);
      return PokemonListModel.fromJson(json);
    } catch (e) {
      throw Strings.failedToFetchPokemons;
    }
  }
}
