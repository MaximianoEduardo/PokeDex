import 'package:app_pokedex/data/repository.dart';
import 'package:app_pokedex/models/pokemon_evolution.dart';
import 'package:app_pokedex/models/pokemon_specie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonSpecieBloc extends Cubit<PokemonSpecieState> {
  final PokemonRepository _repository;

  PokemonSpecieBloc(this._repository) : super(EmptyPokemonSpecieDetails());

  Future getPokemonSpecie(idPokemon) async {
    emit(LoadingPokemonSpecieDetails());

    try {
      final pokemonSpecieDetailsResponse =
          await _repository.getPokemonSpecie(idPokemon.toString());

      final String pokemonChainID = pokemonSpecieDetailsResponse
          .evolutionChain.url
          .split('/')[6]
          .toString();

      Future getPokemonEvolution() async {
        try {
          final pokemonEvolutionResponse =
              await _repository.getPokemonEvolution(pokemonChainID.toString());

          emit(
            PokemonSpecieDetails(
                pokemonSpecie: pokemonSpecieDetailsResponse,
                pokemonEvolution: pokemonEvolutionResponse),
          );
        } on Exception {
          emit(
            Error(
              message:
                  'Sorry, we Didnt find any pokemon related to your search! Try another one or changing how you searching.',
            ),
          );
        }
      }

      return getPokemonEvolution();
    } on Exception {
      emit(
        Error(
          message:
              'Sorry, we Didnt find any pokemon related to your search! Try another one or changing how you searching.',
        ),
      );
    }
  }
}

abstract class PokemonSpecieState {}

class LoadingPokemonSpecieDetails extends PokemonSpecieState {}

class Error extends PokemonSpecieState {
  final String message;

  Error({required this.message});
}

class EmptyPokemonSpecieDetails extends PokemonSpecieState {}

class PokemonSpecieDetails extends PokemonSpecieState {
  final PokemonSpecie pokemonSpecie;
  final PokemonEvolution pokemonEvolution;

  PokemonSpecieDetails({
    required this.pokemonSpecie,
    required this.pokemonEvolution,
  });
}
