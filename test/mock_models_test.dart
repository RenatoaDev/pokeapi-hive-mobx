import 'package:pokeapi_project/models/pokemon_list_model.dart';
import 'package:pokeapi_project/models/pokemon_model.dart';

PokemonListModel? getMockPokemonListModel() {
  return PokemonListModel(
    count: 1281,
    next: 'https://pokeapi.co/api/v2/pokemon?offset=10&limit=10',
    previous: null,
    results: [
      PokemonModel(
          name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
      PokemonModel(
          name: 'ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/'),
      PokemonModel(
          name: 'venusaur', url: 'https://pokeapi.co/api/v2/pokemon/3/'),
      PokemonModel(
          name: 'charmander', url: 'https://pokeapi.co/api/v2/pokemon/4/'),
      PokemonModel(
          name: 'charmeleon', url: 'https://pokeapi.co/api/v2/pokemon/5/'),
      PokemonModel(
          name: 'charizard', url: 'https://pokeapi.co/api/v2/pokemon/6/'),
      PokemonModel(
          name: 'squirtle', url: 'https://pokeapi.co/api/v2/pokemon/7/'),
      PokemonModel(
          name: 'wartortle', url: 'https://pokeapi.co/api/v2/pokemon/8/'),
      PokemonModel(
          name: 'blastoise', url: 'https://pokeapi.co/api/v2/pokemon/9/'),
      PokemonModel(
          name: 'caterpie', url: 'https://pokeapi.co/api/v2/pokemon/10/'),
    ],
  );
}

Map<String, dynamic> getMockPokemonListJson() {
  return {
    "count": 1281,
    "next": "https://pokeapi.co/api/v2/pokemon?offset=10&limit=10",
    "previous": null,
    "results": [
      {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"},
      {"name": "ivysaur", "url": "https://pokeapi.co/api/v2/pokemon/2/"},
      {"name": "venusaur", "url": "https://pokeapi.co/api/v2/pokemon/3/"},
      {"name": "charmander", "url": "https://pokeapi.co/api/v2/pokemon/4/"},
      {"name": "charmeleon", "url": "https://pokeapi.co/api/v2/pokemon/5/"},
      {"name": "charizard", "url": "https://pokeapi.co/api/v2/pokemon/6/"},
      {"name": "squirtle", "url": "https://pokeapi.co/api/v2/pokemon/7/"},
      {"name": "wartortle", "url": "https://pokeapi.co/api/v2/pokemon/8/"},
      {"name": "blastoise", "url": "https://pokeapi.co/api/v2/pokemon/9/"},
      {"name": "caterpie", "url": "https://pokeapi.co/api/v2/pokemon/10/"},
    ],
  };
}
