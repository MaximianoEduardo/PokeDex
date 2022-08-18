import 'package:app_pokedex/common/capitalize.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:flutter/material.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({
    Key? key,
    required this.types,
  }) : super(key: key);

  final List<Type> types;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...types
            .map((pokemonType) => Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: _setColorByType(pokemonType.type.name),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8,
                      ),
                      child: Text(
                        capitalize(pokemonType.type.name),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ))
            .toList()
      ],
    );
  }
}

_setColorByType(String type) {
  switch (type) {
    case 'bug':
      return const Color.fromRGBO(140, 178, 48, 1);
    case 'dark':
      return const Color.fromRGBO(111, 110, 120, 1);
    case 'dragon':
      return const Color.fromRGBO(88, 87, 95, 1);
    case 'electric':
      return const Color.fromRGBO(238, 213, 53, 1);
    case 'fairy':
      return const Color.fromRGBO(237, 110, 199, 1);
    case 'fighting':
      return const Color.fromRGBO(208, 65, 100, 1);
    case 'fire':
      return const Color.fromRGBO(253, 125, 36, 1);
    case 'flying':
      return const Color.fromRGBO(116, 143, 201, 1);
    case 'ghost':
      return const Color.fromRGBO(85, 106, 174, 1);
    case 'grass':
      return const Color.fromRGBO(98, 185, 87, 1);
    case 'ground':
      return const Color.fromRGBO(221, 119, 72, 1);
    case 'ice':
      return const Color.fromRGBO(145, 216, 223, 1);
    case 'normal':
      return const Color.fromRGBO(157, 160, 170, 1);
    case 'poison':
      return const Color.fromRGBO(159, 82, 204, 1);
    case 'psychic':
      return const Color.fromRGBO(255, 101, 104, 1);
    case 'rock':
      return const Color.fromRGBO(212, 194, 148, 1);
    case 'steel':
      return const Color.fromRGBO(76, 145, 178, 1);
    case 'water':
      return const Color.fromRGBO(74, 144, 218, 1);
    default:
      return Colors.grey;
  }
}
