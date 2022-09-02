// To parse this JSON data, do
//
//     final pokemonEvolution = pokemonEvolutionFromMap(jsonString);

import 'dart:convert';

PokemonEvolution pokemonEvolutionFromMap(String str) =>
    PokemonEvolution.fromMap(json.decode(str));

String pokemonEvolutionToMap(PokemonEvolution data) =>
    json.encode(data.toMap());

class PokemonEvolution {
  PokemonEvolution({
    required this.babyTriggerItem,
    required this.chain,
    required this.id,
  });

  final dynamic babyTriggerItem;
  final Chain chain;
  final int id;

  factory PokemonEvolution.fromMap(Map<String, dynamic> json) =>
      PokemonEvolution(
        babyTriggerItem: json["baby_trigger_item"],
        chain: Chain.fromMap(json["chain"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "baby_trigger_item": babyTriggerItem,
        "chain": chain.toMap(),
        "id": id,
      };
}

class Chain {
  Chain({
    required this.evolutionDetails,
    required this.evolvesTo,
    required this.isBaby,
    required this.species,
  });

  final List<EvolutionDetail> evolutionDetails;
  final List<Chain> evolvesTo;
  final bool isBaby;
  final Species species;

  factory Chain.fromMap(Map<String, dynamic> json) => Chain(
        evolutionDetails: List<EvolutionDetail>.from(
            json["evolution_details"].map((x) => EvolutionDetail.fromMap(x))),
        evolvesTo:
            List<Chain>.from(json["evolves_to"].map((x) => Chain.fromMap(x))),
        isBaby: json["is_baby"],
        species: Species.fromMap(json["species"]),
      );

  Map<String, dynamic> toMap() => {
        "evolution_details":
            List<dynamic>.from(evolutionDetails.map((x) => x.toMap())),
        "evolves_to": List<dynamic>.from(evolvesTo.map((x) => x.toMap())),
        "is_baby": isBaby,
        "species": species.toMap(),
      };
}

class EvolutionDetail {
  EvolutionDetail({
    required this.gender,
    required this.heldItem,
    required this.item,
    required this.knownMove,
    required this.knownMoveType,
    required this.location,
    required this.minAffection,
    required this.minBeauty,
    required this.minHappiness,
    required this.minLevel,
    required this.needsOverworldRain,
    required this.partySpecies,
    required this.partyType,
    required this.relativePhysicalStats,
    required this.timeOfDay,
    required this.tradeSpecies,
    required this.trigger,
    required this.turnUpsideDown,
  });

  final dynamic gender;
  final dynamic heldItem;
  final dynamic item;
  final dynamic knownMove;
  final dynamic knownMoveType;
  final dynamic location;
  final dynamic minAffection;
  final dynamic minBeauty;
  final dynamic minHappiness;
  final dynamic minLevel;
  final bool needsOverworldRain;
  final dynamic partySpecies;
  final dynamic partyType;
  final dynamic relativePhysicalStats;
  final String timeOfDay;
  final dynamic tradeSpecies;
  final Species trigger;
  final bool turnUpsideDown;

  factory EvolutionDetail.fromMap(Map<String, dynamic> json) => EvolutionDetail(
        gender: json["gender"],
        heldItem: json["held_item"],
        item: json["item"],
        knownMove: json["known_move"],
        knownMoveType: json["known_move_type"],
        location: json["location"],
        minAffection: json["min_affection"],
        minBeauty: json["min_beauty"],
        minHappiness: json["min_happiness"],
        minLevel: json["min_level"],
        needsOverworldRain: json["needs_overworld_rain"],
        partySpecies: json["party_species"],
        partyType: json["party_type"],
        relativePhysicalStats: json["relative_physical_stats"],
        timeOfDay: json["time_of_day"],
        tradeSpecies: json["trade_species"],
        trigger: Species.fromMap(json["trigger"]),
        turnUpsideDown: json["turn_upside_down"],
      );

  Map<String, dynamic> toMap() => {
        "gender": gender,
        "held_item": heldItem,
        "item": item,
        "known_move": knownMove,
        "known_move_type": knownMoveType,
        "location": location,
        "min_affection": minAffection,
        "min_beauty": minBeauty,
        "min_happiness": minHappiness,
        "min_level": minLevel ?? trigger.name,
        "needs_overworld_rain": needsOverworldRain,
        "party_species": partySpecies,
        "party_type": partyType,
        "relative_physical_stats": relativePhysicalStats,
        "time_of_day": timeOfDay,
        "trade_species": tradeSpecies,
        "trigger": trigger.toMap(),
        "turn_upside_down": turnUpsideDown,
      };
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
