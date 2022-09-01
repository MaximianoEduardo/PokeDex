import 'dart:io';

import 'package:app_pokedex/data/repository.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Generation {
  generationI,
  generationII,
  generationIII,
  generationIV,
  generationV,
  generationVI,
  generationVII,
  generationVIII,
}

enum SortPokemons {
  smallestID,
  highestID,
  atoz,
  ztoa,
}

class PokedexBloc extends Cubit<PokedexState> {
  final PokemonRepository _repository;
  final List<Pokedex> pokemonsList = [];

  PokedexBloc(this._repository) : super(EmptyPokedex());

  listCompRange(int start, int stop, int step) {
    if (step == 0) throw Exception("Step cannot be 0");
    if (start == stop) return [];
    bool forwards = start < stop;
    return forwards == step > 0
        ? forwards
            ? [
                for (int i = 0; i * step <= stop - start; i++)
                  start + (i * step)
              ]
            : [for (int i = 0; i * step > stop - start; i++) start + (i * step)]
        : [];
  }

  listPokemons(
    int initialGeneration,
    int endGeneration,
    Generation generationName,
    SortPokemons sort,
  ) {
    List generation = listCompRange(initialGeneration, endGeneration, 1);

    generation
        .map((e) => getPokemons(
              e.toString(),
              generationName,
              sort,
            ))
        .toList();
  }

  setGeneration(generationName) {
    pokemonsList.clear();

    emit(ChangingGeneration(namegeneration: generationName));
  }

  setSort(sortName, generationName) {
    emit(ChangingSort(
      sort: sortName,
      namegeneration: generationName,
    ));
  }

  Future searchPokemon(String query) async {
    pokemonsList.clear();

    emit(LoadingPokemons());

    try {
      final pokemon = await _repository.getPokemon(query);

      pokemonsList.add(pokemon);

      emit(PokemonSearched(pokemon: pokemon));
    } on Exception {
      emit(
        Error(
          message:
              'Sorry, we Didnt find any pokemon related to your search! Try another one or changing how you searching.',
        ),
      );
    }
  }

  Future getPokemons(
    idPokemon,
    Generation generation,
    SortPokemons sort,
  ) async {
    emit(LoadingPokemons());

    try {
      final pokemon = await _repository.getPokemon(idPokemon.toString());
      pokemonsList.add(pokemon);

      var seen = <String>{};

      List<Pokedex> uniquenum = pokemonsList
          .where((pokemon) => seen.add(pokemon.id.toString()))
          .toList();

      uniquenum.sort((a, b) => a.id - b.id == 0 ? -1 : a.id - b.id);

      switch (sort) {
        case SortPokemons.smallestID:
          uniquenum;
          break;
        case SortPokemons.highestID:
          uniquenum.sort(
            (a, b) => b.id.compareTo(a.id),
          );
          break;
        case SortPokemons.atoz:
          uniquenum.sort(
            (a, b) => a.name.compareTo(b.name),
          );
          break;
        case SortPokemons.ztoa:
          uniquenum.sort(
            (a, b) => b.name.compareTo(a.name),
          );
          break;
        default:
      }

      emit(PokemonList(
        pokemon: uniquenum,
        generation: generation,
        sort: sort,
      ));
    } on SocketException {
      rethrow;
    } on HttpException {
      rethrow;
    } on FormatException {
      rethrow;
    } on Exception catch (e) {
      emit(
        Error(
          message: e.toString(),
        ),
      );
    }
  }

  // filterPokemon(pokemonSearched) {
  //   var seen = <String>{};

  //   List<Pokedex> uniquenum = pokemonsList
  //       .where((pokemon) => seen.add(pokemon.id.toString()))
  //       .toList();

  //   uniquenum.sort((a, b) => a.id - b.id == 0 ? -1 : a.id - b.id);

  //   List<Pokedex> searchedpokemonsList = uniquenum
  //       .where((pokemons) => pokemons.id == int.parse(pokemonSearched))
  //       .toList();

  //   emit(PokemonList(pokemon: searchedpokemonsList));
  // }
}

abstract class PokedexState {}

class EmptyPokedex extends PokedexState {}

class PokemonList extends PokedexState {
  final List<Pokedex> pokemon;
  final Generation generation;
  final SortPokemons sort;

  PokemonList({
    required this.pokemon,
    required this.generation,
    required this.sort,
  });
}

class LoadingPokemons extends PokedexState {}

class Error extends PokedexState {
  final String message;

  Error({required this.message});
}

class ChangingGeneration extends PokedexState {
  final Generation namegeneration;

  ChangingGeneration({required this.namegeneration});
}

class ChangingSort extends PokedexState {
  final SortPokemons sort;
  final Generation namegeneration;

  ChangingSort({
    required this.sort,
    required this.namegeneration,
  });
}

class PokemonSearched extends PokedexState {
  final Pokedex pokemon;

  PokemonSearched({required this.pokemon});
}
