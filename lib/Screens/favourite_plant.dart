import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Providers/favoris_provider.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/gridTilesPlants.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({super.key});

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  Widget build(BuildContext context) {
    final favs = context.watch<FavoriteProvider>().myFav;
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: const Text("  Liste des favoris",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite,
                      color: Color(0xff00703C), size: 30),
                ),
              )
            ],
            backgroundColor: Colors.white,
            leading: BackButton(color: darkGrey)),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: (favs.length) / 2,
          mainAxisSpacing: (favs.length) / 2,
          shrinkWrap: true,
          childAspectRatio: (185 / 225),
          padding: EdgeInsets.all(10),
          children: List<Widget>.generate(favs.length, (index) {
            return GridTile(
                child: GridTilesPlants(
              name: favs[index].name,
              image: favs[index].image,
              price: favs[index].price.toString(),
              index: index,
            ));
          }),
        ),
        bottomNavigationBar: BottomBar(
          isClient: true,
        ));
  }
}
