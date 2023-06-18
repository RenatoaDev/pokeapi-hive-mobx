import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pokeapi_project/models/pokemon_model.dart';
import 'package:pokeapi_project/models/theme_color_model.dart';
import 'package:pokeapi_project/utils/strings.dart';

class Boxes {
  static Box<PokemonModel> getFavorites() =>
      Hive.box<PokemonModel>(Strings.dbFavorites);
  static Box<ThemeColorModel> getTheme() =>
      Hive.box<ThemeColorModel>(Strings.dbThemeBox);

  static void addFavorite(PokemonModel pokemon) {
    final box = getFavorites();
    pokemon.addedDate = DateTime.now();
    box.put(pokemon.url, pokemon);
  }

  static void removeFavorite(PokemonModel pokemon) {
    final box = getFavorites();
    box.delete(pokemon.url);
  }

  static Color getPrimaryColor() {
    final themeBox = getTheme();
    final themeColor = themeBox.get(Strings.keyThemeColor);
    return themeColor?.primaryColor ?? const Color(0xff006875);
  }

  static void setPrimaryColor(Color primaryColor) {
    final themeBox = getTheme();
    final themeColor = themeBox.get(Strings.keyThemeColor);
    if (themeColor != null) {
      themeColor.primaryColor = primaryColor;
      themeBox.put(Strings.keyThemeColor, themeColor);
    } else {
      final newThemeColor = ThemeColorModel(primaryColor: primaryColor);
      themeBox.put(Strings.keyThemeColor, newThemeColor);
    }
  }
}
