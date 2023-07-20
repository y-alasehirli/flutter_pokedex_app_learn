import 'package:bolum26_flutter_pokedex_app/const/sabitler.dart';
import 'package:bolum26_flutter_pokedex_app/model/pokedex_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PokemonDetail extends StatelessWidget {
  final PokedexPokemon pokeItem;
  const PokemonDetail({required this.pokeItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientPortrait = MediaQuery.of(context).orientation ==
        Orientation
            .portrait; /* "context" e bağlı çalıştığı için "build" içine tanımladık ve ayrıca telefonun "portrait" olduğunu kontrol eden bir "controller" tarzı değişken oluşturduk. Sürekli uzun kod yazımından kaçınmak için. */
    return Stack(
      children: [
        Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          child: Container(
            decoration: Sabitler.pokeDetailBoxDeco,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: [
                SizedBox(
                  height: 95,
                ),
                Text(
                  "${pokeItem.name}",
                  style: Sabitler.pokeDetailTitleTextStyle,
                ),
                Divider(
                  indent: orientPortrait ? 50 : 100,
                  endIndent: orientPortrait ? 50 : 100,
                  color: Colors.red.shade300,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.weightHanging,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${pokeItem.weight}",
                        style: Sabitler.pokeDetailNormaTextStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.height_outlined,
                        size: 35,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${pokeItem.height}",
                        style: Sabitler.pokeDetailNormaTextStyle,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: orientPortrait ? Alignment(0, -0.6) : Alignment(0, -0.9),
          child: Hero(
            tag: "${pokeItem.id}",
            child: Image.network(
              "${pokeItem.img}",
              fit: BoxFit.cover,
              scale: 0.7,
            ),
          ),
        )
      ],
    );
  }
}
