import 'package:mobx/mobx.dart';
import 'package:pokeapi_project/locator.dart';
import 'package:pokeapi_project/models/pokemon_model.dart';
import 'package:pokeapi_project/models/pokemon_list_model.dart';
import 'package:pokeapi_project/repositories/home_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeRepository _homeRepository = getIt();

  @observable
  bool loading = true;

  @observable
  bool errorLoading = false;

  @observable
  String errorMsg = '';

  List<PokemonModel> pokemons = [];

  @observable
  String? nextUrl;

  @action
  Future<void> getPokemons() async {
    try {
      errorLoading = false;
      loading = true;

      final PokemonListModel? pokemonListModel =
          await _homeRepository.fetchPokemons(nextUrl);
      if (pokemonListModel != null) {
        pokemons.addAll(pokemonListModel.results);
        nextUrl = pokemonListModel.next;
      }

      loading = false;
    } catch (e) {
      errorLoading = true;
      errorMsg = e.toString();
    }
  }
}
