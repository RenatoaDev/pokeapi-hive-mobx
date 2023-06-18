import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokeapi_project/boxes.dart';
import 'package:pokeapi_project/locator.dart';
import 'package:pokeapi_project/models/theme_color_model.dart';
import 'package:pokeapi_project/pages/initial/initial_view.dart';
import 'package:pokeapi_project/setup_db.dart';
import 'package:pokeapi_project/utils/color_list.dart';
import 'package:pokeapi_project/utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await setupDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox<ThemeColorModel>(Strings.dbThemeBox),
      builder: (context, snapshot) {
        return ValueListenableBuilder<Box<ThemeColorModel>>(
          valueListenable: Boxes.getTheme().listenable(),
          builder: (context, themeBox, _) {
            final themeColor = themeBox.get(Strings.keyThemeColor);
            final primaryColor =
                themeColor?.primaryColor ?? ColorList.colors[0];
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: Strings.titleApp,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.white,
                  primary: primaryColor,
                ),
              ),
              home: const InitialView(),
            );
          },
        );
      },
    );
  }
}
