import 'package:app_pokedex/common/capitalize.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:app_pokedex/screens/home/widgets/pokemon_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokedex pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '#${pokemon.id.toString()}',
                            style: const TextStyle(
                              color: Color.fromRGBO(23, 23, 27, 0.6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              capitalize(pokemon.name),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PokemonType(
                        types: pokemon.types,
                      )
                    ],
                  ),
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
              top: 15,
              right: 15,
              child: Image.network(
                pokemon.sprites.other.officialArtwork.frontDefault,
                width: 130,
                height: 130,
              ),
            )
          ],
        ),
      ),
    );
  }
}
