import 'package:pokeapi_project/utils/strings.dart';

extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }

    String firstLetter = substring(0, 1).toUpperCase();
    String remainingText = substring(1);

    return '$firstLetter$remainingText';
  }

  String getImageUrlFromUrl() {
    final parts = split('/');
    final id = parts[parts.length - 2];

    String imageUrl = '${Strings.baseImageUrl}/$id.png';
    return imageUrl;
  }
}

extension IntExtension on int {
  String toPokemonUrl() {
    return '${Strings.baseUrlPokemon}$this/';
  }
}
