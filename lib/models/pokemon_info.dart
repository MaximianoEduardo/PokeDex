import 'dart:convert';
import 'package:flutter/material.dart';

PokemonInfo pokemonInfoFromMap(String str) =>
    PokemonInfo.fromMap(json.decode(str));

String pokemonInfoToMap(PokemonInfo data) => json.encode(data.toMap());

class PokemonInfo {
  PokemonInfo({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  final List<dynamic> abilities;
  final int baseExperience;
  final List<dynamic> forms;
  final List<dynamic> gameIndices;
  final int height;
  final List<dynamic> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<dynamic> moves;
  final String name;
  final int order;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites sprites;
  final List<dynamic> stats;
  final List<Type> types;
  final int weight;

  factory PokemonInfo.fromMap(Map<dynamic, dynamic> json) => PokemonInfo(
        abilities: List<dynamic>.from(json["abilities"].map((x) => x)),
        baseExperience: json["base_experience"],
        forms: List<dynamic>.from(json["forms"].map((x) => x)),
        gameIndices: List<dynamic>.from(json["game_indices"].map((x) => x)),
        height: json["height"],
        heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<dynamic>.from(json["moves"].map((x) => x)),
        name: json["name"],
        order: json["order"],
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromMap(json["species"]),
        sprites: Sprites.fromMap(json["sprites"]),
        stats: List<dynamic>.from(json["stats"].map((x) => x)),
        types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x)),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms.map((x) => x)),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x)),
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x)),
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        "species": species.toMap(),
        "sprites": sprites.toMap(),
        "stats": List<dynamic>.from(stats.map((x) => x)),
        "types": List<dynamic>.from(types.map((x) => x.toMap())),
        "weight": weight,
      };

  List get typeString => _getTypes(types);

  Color? get baseColor => _color(typeString[0]);
}

_color(typeString) {
  switch (typeString) {
    case 'bug':
      return const Color.fromRGBO(139, 214, 116, 1);
    case 'dark':
      return const Color.fromRGBO(88, 87, 95, 1);
    case 'dragon':
      return const Color.fromRGBO(15, 106, 192, 1);
    case 'electric':
      return const Color.fromRGBO(242, 203, 85, 1);
    case 'fairy':
      return const Color.fromRGBO(235, 168, 195, 1);
    case 'fighting':
      return const Color.fromRGBO(235, 73, 113, 1);
    case 'fire':
      return const Color.fromRGBO(255, 167, 86, 1);
    case 'flying':
      return const Color.fromRGBO(116, 143, 201, 1);
    case 'ghost':
      return const Color.fromRGBO(133, 113, 190, 1);
    case 'grass':
      return const Color.fromRGBO(139, 190, 138, 1);
    case 'ground':
      return const Color.fromRGBO(247, 133, 81, 1);
    case 'ice':
      return const Color.fromRGBO(97, 206, 192, 1);
    case 'normal':
      return const Color.fromRGBO(181, 185, 196, 1);
    case 'poison':
      return const Color.fromRGBO(159, 110, 151, 1);
    case 'psychic':
      return const Color.fromRGBO(234, 93, 96, 1);
    case 'rock':
      return const Color.fromRGBO(186, 171, 130, 1);
    case 'steel':
      return const Color.fromRGBO(65, 125, 154, 1);
    case 'water':
      return const Color.fromRGBO(88, 171, 246, 1);
    default:
      return Colors.grey;
  }
}

_getTypes(List<Type> types) {
  final typelist = types.map((e) => e.type);

  final typeString = typelist.map((e) => e.name).toList();

  return typeString;
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class Sprites {
  Sprites();

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites();

  Map<String, dynamic> toMap() => {};
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int slot;
  final Species type;

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromMap(json["type"]),
      );

  Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type.toMap(),
      };
}


// Color? _color({required String type}){
//   switch (type) {
//     case :
      
//       break;
//     default:
//   }
// }