import 'dart:convert';

import 'package:bolum26_flutter_pokedex_app/model/pokedex_model.dart';

import 'package:http/http.dart' as http;

class DataHelper {
  
  static var _apiUrl = Uri.parse(
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

  static Future<Pokedex> jsonDonustur() async {
    var json = await http.get(_apiUrl);
    var decodedJson = jsonDecode(json.body);
    var pokedexItem = Pokedex.fromJson(decodedJson);
    return pokedexItem /* .pokemon!.map((e) => Pokedex(e)).toList() */;
  }

}
