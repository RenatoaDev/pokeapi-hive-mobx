import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokeapi_project/pages/home/store/home_store.dart';
import 'mock_home_repository.dart';
import 'mock_models_test.dart' as model;

import 'test_locator.dart';

void main() {
  group('HomeStore', () {
    late HomeStore store;

    setUpAll(() {
      setupTestLocator();
    });

    setUp(() {
      store = testGetIt<HomeStore>();
    });

    test('getPokemons() should fetch and update pokemons list', () async {
      when(mockHomeRepository.fetchPokemons(any)).thenAnswer(
        (_) async => model.getMockPokemonListModel(),
      );

      expect(store.loading, true);

      await store.getPokemons();

      await Future.delayed(Duration.zero);

      expect(store.loading, false);
      expect(store.errorLoading, false);
      expect(store.errorMsg, '');

      expect(store.pokemons.isNotEmpty, true);

      expect(store.nextUrl, isNotNull);
    });

    test('getPokemons() should handle error and set errorLoading to true',
        () async {
      when(mockHomeRepository.fetchPokemons(any)).thenThrow(Exception());

      expect(store.loading, true);

      await store.getPokemons();

      expect(store.loading, true);
      expect(store.errorLoading, true);
      expect(store.errorMsg.isNotEmpty, true);
    });
  });
}
