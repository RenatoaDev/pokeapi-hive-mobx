import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokeapi_project/locator.dart';
import 'package:pokeapi_project/pages/details/details_view.dart';
import 'package:pokeapi_project/pages/error/error_view.dart';
import 'package:pokeapi_project/pages/home/store/home_store.dart';
import 'package:pokeapi_project/utils/strings.dart';
import 'package:pokeapi_project/widgets/custom_card_pokemon.dart';
import 'package:pokeapi_project/widgets/custom_scaffold.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin<HomeView> {
  @override
  bool get wantKeepAlive => true;

  late HomeStore store;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    store = getIt<HomeStore>();
    store.getPokemons();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        store.getPokemons();
      }
    });
  }

  @override
  void dispose() {
    Hive.close();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScaffold(
      title: Strings.homeTitle,
      body: Observer(
        builder: (context) {
          if (store.errorLoading) {
            return ErrorView(
              errorMsg: store.errorMsg,
              onPressed: store.getPokemons,
            );
          }

          return Stack(
            children: [
              store.loading && store.pokemons.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      child: GridView.builder(
                        controller: _scrollController,
                        itemCount: store.pokemons.length + 1,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          if (index < store.pokemons.length) {
                            final pokemon = store.pokemons[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsView(
                                      pokemonUrl: pokemon.url,
                                    ),
                                  ),
                                );
                              },
                              child: CustomCardPokemon(pokemon: pokemon),
                            );
                          } else {
                            if (store.nextUrl != null) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Container();
                            }
                          }
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
