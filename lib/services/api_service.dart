import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokeapi_project/utils/strings.dart';

class ApiService {
  Future<Map<String, dynamic>> fetchPokemons(String? url) async {
    final response = await http
        .get(Uri.parse(url ?? '${Strings.baseUrl}/pokemon?limit=10&offset=0'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Strings.failedToFetchPokemons;
    }
  }

  Future<Map<String, dynamic>> fetchPokemon(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Strings.failedToFetchPokemon;
    }
  }

  Future<Map<String, dynamic>> fetchSpecies(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Strings.failedToFetchSpecies;
    }
  }

  Future<Map<String, dynamic>> fetchEvolutionChain(int id) async {
    final response =
        await http.get(Uri.parse('${Strings.baseEvolutionChain}/$id'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Strings.failedToFetchEvolutionChain;
    }
  }
}
