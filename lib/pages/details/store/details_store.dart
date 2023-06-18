import 'package:mobx/mobx.dart';
import 'package:pokeapi_project/boxes.dart';
import 'package:pokeapi_project/locator.dart';
import 'package:pokeapi_project/models/evolution_chain_model.dart';
import 'package:pokeapi_project/models/pokemon_details_model.dart';
import 'package:pokeapi_project/models/pokemon_model.dart';
import 'package:pokeapi_project/repositories/details_repository.dart';
import 'package:pokeapi_project/utils/extension.dart';
part 'details_store.g.dart';

class DetailsStore = DetailsStoreBase with _$DetailsStore;

abstract class DetailsStoreBase with Store {
  final DetailsRepository _detailsRepository = getIt();

  @observable
  bool loading = true;

  @observable
  bool errorLoading = false;

  @observable
  String errorMsg = '';

  @observable
  bool isFavorite = false;

  late PokemonDetailsModel pokemonDetails;
  late EvolutionChainModel pokemonEvolution;

  getPokemon({required String url}) async {
    try {
      errorLoading = false;
      loading = true;

      pokemonDetails = await _detailsRepository.fetchPokemon(url);
      pokemonEvolution =
          await _detailsRepository.fetchEvolutionChain(pokemonDetails.id);

      isFavorite = Boxes.getFavorites().containsKey(url);

      loading = false;
    } catch (e) {
      errorLoading = true;
      errorMsg = e.toString();
    }
  }

  addFavorite() {
    PokemonModel pokemonModel = PokemonModel(
      name: pokemonDetails.name,
      url: pokemonDetails.id.toPokemonUrl(),
    );
    Boxes.addFavorite(pokemonModel);
    isFavorite = true;
  }

  removeFavorite() {
    PokemonModel pokemonModel = PokemonModel(
      name: pokemonDetails.name,
      url: pokemonDetails.id.toPokemonUrl(),
    );
    Boxes.removeFavorite(pokemonModel);
    isFavorite = false;
  }
}
