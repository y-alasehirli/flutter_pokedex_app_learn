import 'package:bolum26_flutter_pokedex_app/const/data_helper.dart';
import 'package:bolum26_flutter_pokedex_app/model/pokedex_model.dart';
import 'package:bolum26_flutter_pokedex_app/widgets/pokemon_detail_widget.dart';
import 'package:bolum26_flutter_pokedex_app/widgets/pokemon_main_widget.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Pokedex? pokedex;
  Future<Pokedex>? pokeInit;
  @override
  void initState() {
    super.initState();
    pokeInit = DataHelper.jsonDonustur();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pokeInit,
      /* "DataHelper.jsonDonustur()" "future:" objectine direk tanımlanabilirdi ama bu sefer her sayfa "push-pop" edildiğinde tekrar tetikleneceği için sayfa her defasında internetten veri çekecek hem performans yavaşlaması hemde mobil veri israfı olacaktır. Bu yüzden "initState()" içerisinde bir kere oluşturdukki performans ve israf olmasın. Bu noktaya dikkat etmemiz lazım. */
      initialData: pokedex,
      /* "buildcontext" oluşturulana kadar yada hata verdiğinde "buildera" local değerleri verecek bir değişken tanımlıyoruz. "pokedex" değişkeni birşey ifade etmiyor şuan için, içerisinde bir initial değer olmadığı için. */
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          pokedex = snapshot.data;

          /* list olan "pokedex.pokemon" öğesini ."map()" komutu ile çevirip Widgetlarımızı oluşturuyoruz. Burada Liste itemlerini tek ve genel adları ile kullanabiliyoruz, çünkü her bir item için aynı "widget" üretecek. */
          return GridView.count(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 4,
              /* Telefon "portrait" durumunda ise "2" count atıyor eğer "landscape" moduna geçerse 4 tane oluşturuyor. Kısa çözüm */
              children: pokedex!.pokemon!.map((pokeItem) {
                return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return PokemonDetail(pokeItem: pokeItem!);
                          });
                    },
                    child: Hero(
                        tag: "${pokeItem!.id}",
                        child: PokemonMain(pokeItem: pokeItem)));
              }).toList());

          /*Builder ile oluşturma kodu. Listemizi [index] değerleri ile oluşturduk. Her iteme "[index]" yazmamız gerekli. */
          /*   return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Text(pokedex.pokemon[index].name as String);
              }); */
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
