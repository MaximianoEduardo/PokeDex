import 'package:app_pokedex/data/repository.dart';
import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexBloc extends Cubit<PokedexState> {
  final PokemonRepository _repository;
  final List<Pokedex> pokemonsList = [];

  PokedexBloc(this._repository) : super(EmptyPokedex());

  ListPokemons() {
    List generationI = List<int>.generate(151, (index) => index + 1);

    generationI.map((e) => getPokemons(e.toString())).toList();
  }

  Future getPokemons(idPokemon) async {
    emit(LoadingPokemons());

    try {
      final pokemon = await _repository.getPokemon(idPokemon.toString());

      pokemonsList.add(pokemon);

      emit(AllPokemons(pokemon: pokemonsList));

      // if (pokemon == null) {
      //   emit(Error(message: "Dados Vazios"));
      // } else {
      //   emit(AllPokemons(pokemon: pokemon));
      // }
    } on Exception catch (e) {
      emit(
        Error(
          message: e.toString(),
        ),
      );
    }

    throw Exception();
  }
}

abstract class PokedexState {}

class EmptyPokedex extends PokedexState {}

class AllPokemons extends PokedexState {
  final List<Pokedex> pokemon;

  AllPokemons({required this.pokemon});
}

class LoadingPokemons extends PokedexState {}

class Error extends PokedexState {
  final String message;

  Error({required this.message});
}
