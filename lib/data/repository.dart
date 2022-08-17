import 'dart:io';

import 'package:app_pokedex/models/pokemon_info.dart';

import '../service/http_service.dart';

class PokemonRepository {
  Future<Pokedex> getPokemon(String query) async {
    try {
      final response = await HttpService.getRequest(query);

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
}
