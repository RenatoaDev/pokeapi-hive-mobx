import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokeapi_project/locator.dart';
import 'package:pokeapi_project/pages/details/store/details_store.dart';
import 'package:pokeapi_project/pages/details/widgets/custom_ability_widget.dart';
import 'package:pokeapi_project/pages/details/widgets/custom_evolution_widget.dart';
import 'package:pokeapi_project/pages/details/widgets/custom_stat_widget.dart';
import 'package:pokeapi_project/pages/details/widgets/custom_type_widget.dart';
import 'package:pokeapi_project/pages/error/error_view.dart';
import 'package:pokeapi_project/utils/details_translations.dart';
import 'package:pokeapi_project/utils/extension.dart';
import 'package:pokeapi_project/utils/strings.dart';

class DetailsView extends StatefulWidget {
  final String pokemonUrl;
  const DetailsView({
    Key? key,
    required this.pokemonUrl,
  }) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late DetailsStore store;

  @override
  void initState() {
    super.initState();
    store = getIt();
    store.getPokemon(url: widget.pokemonUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: store.loading ? AppBar() : null,
        body: Observer(builder: (context) {
          if (store.errorLoading) {
            return ErrorView(
              errorMsg: store.errorMsg,
              onPressed: () {
                store.getPokemon(url: widget.pokemonUrl);
              },
            );
          }
          return store.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      stretch: true,
                      expandedHeight: 250,
                      collapsedHeight: 150,
                      elevation: 0,
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IconButton(
                            onPressed: () {
                              store.isFavorite
                                  ? store.removeFavorite()
                                  : store.addFavorite();
                            },
                            icon: Observer(builder: (context) {
                              return store.isFavorite
                                  ? const Icon(Icons.favorite)
                                  : const Icon(Icons.favorite_outline);
                            }),
                          ),
                        )
                      ],
                      flexibleSpace: SafeArea(
                        top: true,
                        child: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: store.pokemonDetails.sprites.other
                                    .home.frontDefault,
                                placeholder: (context, url) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                height: 150,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      sliver: SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                store.pokemonDetails.name
                                    .capitalizeFirstLetter(),
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomTypeWidget(
                                  pokemonDetails: store.pokemonDetails),
                              const SizedBox(height: 10),
                              detailRow(
                                  Strings.heightText,
                                  DetailsTranslations.translateHeight(
                                      store.pokemonDetails.height)),
                              const SizedBox(
                                height: 4,
                              ),
                              detailRow(
                                  Strings.weightText,
                                  DetailsTranslations.translateWeight(
                                      store.pokemonDetails.weight)),
                              const SizedBox(height: 4),
                              detailRow(
                                  Strings.baseExperienceText,
                                  store.pokemonDetails.baseExperience
                                      .toString()),
                              const SizedBox(height: 10),
                              CustomStatWidget(
                                  pokemonDetails: store.pokemonDetails),
                              CustomAbilityWidget(
                                  pokemonDetails: store.pokemonDetails),
                              CustomEvolutionWidget(
                                  pokemonDetails: store.pokemonDetails,
                                  pokemonEvolution: store.pokemonEvolution),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        }),
      );
    });
  }
}

Widget detailRow(String title, String value) {
  return Row(
    children: [
      Text(
        '$title: ',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    ],
  );
}
