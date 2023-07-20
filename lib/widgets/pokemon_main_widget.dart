import 'package:bolum26_flutter_pokedex_app/const/sabitler.dart';
import 'package:bolum26_flutter_pokedex_app/model/pokedex_model.dart';
import 'package:flutter/material.dart';

class PokemonMain extends StatelessWidget {
  final PokedexPokemon pokeItem;
  const PokemonMain({required this.pokeItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(6),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 8),
            child: FadeInImage.assetNetwork(
              /* "image:" yüklenene kadar "placeholder:" a girdiğimiz "assets" değerini ekrana basıyor. */
              placeholder: "assets/loading.gif",
              image: "${pokeItem.img}",
              fit: BoxFit.contain,
            ),
          )),
          Divider(
            color: Colors.red.shade300,
            indent: 10,
            endIndent: 10,
            thickness: 2,
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: Sabitler.pokeMainBoxDeco,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${pokeItem.name}",
                  style: Sabitler.pokeMainTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
