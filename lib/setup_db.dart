import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:pokeapi_project/models/color_adapter.dart';
import 'package:pokeapi_project/models/pokemon_model.dart';
import 'package:pokeapi_project/models/theme_color_model.dart';
import 'package:pokeapi_project/utils/strings.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> setupDb() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ColorAdapter());
  Hive.registerAdapter(ThemeColorModelAdapter());
  Hive.registerAdapter(PokemonModelAdapter());

  await Hive.openBox<ThemeColorModel>(Strings.dbThemeBox);
  await Hive.openBox<PokemonModel>(Strings.dbFavorites);
}
