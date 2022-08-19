import 'package:app_pokedex/common/capitalize.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:app_pokedex/screens/details/tabs/pokemon_stats_tab.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../widgets/pokemon_default_widget.dart';

class PokemonArguments extends StatefulWidget {
  static const routeName = '/details';

  final Pokedex pokemon;

  const PokemonArguments({
    super.key,
    required this.pokemon,
  });

  @override
  State<PokemonArguments> createState() => _PokemonArgumentsState();
}

class _PokemonArgumentsState extends State<PokemonArguments> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverAppBar(
                backgroundColor: widget.pokemon.baseColor,
                expandedHeight: 300,
                collapsedHeight: 300,
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl: widget.pokemon.sprites.other
                                .officialArtwork.frontDefault,
                            width: 125,
                            height: 125,
                          ),
                          PokemonDefaultWidget(
                            pokemon: widget.pokemon,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                bottom: TabBar(
                    indicatorColor: widget.pokemon.baseColor,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    splashBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    tabs: [
                      Tab(
                        text: capitalize('About'),
                      ),
                      Tab(
                        text: capitalize('Stats'),
                      ),
                      Tab(
                        text: capitalize('Evolution'),
                      ),
                    ]),
              )
            ];
          },
          body: TabBarView(children: [
            DecoratedBox(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Container(
                color: Colors.white,
              ),
            ),
            PokemonStatsTab(pokemon: widget.pokemon),
            Container(
              color: Colors.yellow,
            ),
          ]),
        ),
      ),
    );
  }
}

class ScreenArguments {
  final Pokedex pokemon;

  ScreenArguments(this.pokemon);
}
