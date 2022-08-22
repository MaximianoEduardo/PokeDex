import 'dart:io';

import 'package:app_pokedex/models/pokemon_info.dart';
import 'package:app_pokedex/models/pokemon_specie.dart';

import '../service/http_service.dart';

class PokemonRepository {
  Future<Pokedex> getPokemon(String query) async {
    try {
      final response = await HttpService.getRequest('pokemon/$query');

      if (response.statusCode == 200) {
        final result = pokedexFromMap(response.body);
        return result;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }

    throw Exception();
  }

  Future<PokemonSpecie> getPokemonSpecie(String query) async {
    try {
      final response = await HttpService.getRequest('pokemon-species/$query');

      if (response.statusCode == 200) {
        final result = pokemonSpecieFromMap(response.body);
        return result;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }

    throw Exception();
  }
}
