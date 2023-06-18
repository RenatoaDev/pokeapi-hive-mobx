import 'package:pokeapi_project/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokeapi_project/utils/strings.dart';

class TestApiService extends ApiService {
  @override
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
}
