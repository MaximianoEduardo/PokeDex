import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/pokemon_info.dart';
import '../../../widgets/pokemon_default_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.pokemon}) : super(key: key);

  final Pokedex pokemon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shadowColor: const Color.fromRGBO(139, 190, 138, 0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: pokemon.baseColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: PokemonDefaultWidget(pokemon: pokemon),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 90,
          child: SvgPicture.asset(
            'assets/patterns/6x3.svg',
            color: Colors.white.withOpacity(0.3),
            width: 74,
            height: 32,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: SvgPicture.asset(
            'assets/patterns/pokeball.svg',
            color: Colors.white.withOpacity(0.3),
            width: 145,
            height: 145,
          ),
        ),
        Positioned(
          top: 10,
          right: 15,
          child: CachedNetworkImage(
            imageUrl: pokemon.sprites.other.officialArtwork.frontDefault,
            width: 130,
            height: 130,
          ),
        ),
      ],
    );
  }
}
