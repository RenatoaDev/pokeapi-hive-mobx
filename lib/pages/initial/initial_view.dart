import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokeapi_project/locator.dart';
import 'package:pokeapi_project/pages/favorites/favorites_view.dart';
import 'package:pokeapi_project/pages/home/home_view.dart';
import 'package:pokeapi_project/pages/initial/store/initial_store.dart';
import 'package:pokeapi_project/utils/strings.dart';

class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  late InitialStore store;

  @override
  void initState() {
    super.initState();
    store = getIt<InitialStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: store.pageController,
        onPageChanged: store.setPage,
        children: const [
          HomeView(),
          FavoritesView(),
        ],
      ),
      bottomNavigationBar: Observer(builder: (context) {
        return BottomNavigationBar(
          currentIndex: store.indexPage,
          onTap: store.setPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: Strings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: Strings.favorite,
            ),
          ],
        );
      }),
    );
  }
}
