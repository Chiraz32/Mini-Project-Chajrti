import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Models/Plant.dart';
import 'package:chajrti/Models/favoris.dart';
import 'package:chajrti/Providers/favoris_provider.dart';
import 'package:chajrti/Providers/user_provider.dart';
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
    
    FavoriteProvider prov = Provider.of<FavoriteProvider>(context);
    UserProvider auth = Provider.of<UserProvider>(context);
    var favs = prov.myFav;
    for( Favorite fav in favs) {
      debugPrint("fav i "+fav.toJson().toString());
    } 
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
        body: FutureBuilder <List<Favorite>>(
            future: prov.getAllFavoris(auth.user.token),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: (favs.length) / 2,
          mainAxisSpacing: (favs.length) / 2,
          shrinkWrap: true,
          childAspectRatio: (185 / 225),
          padding: EdgeInsets.all(10),
          children: List<Widget>.generate(favs.length, (index) {
            return GridTile(
                child: GridTilesPlants(
              name: favs[index].plant.name,
              image: favs[index].plant.image,
              price: favs[index].plant.price.toString(),
              plant: favs[index].plant,
              isClient: true,
            )
            );
          }
          ),);
                  }
                  else {
               return  Container (
                  alignment :Alignment.center,
                  color: lightGreen,
                  child: const Text("Vous n'avez pas encore de plantes Favoris  ",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                  color: Color(0xff00703C),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,


                ),));
              
              }
                  }),
    
        bottomNavigationBar: BottomBar(
          isClient: true,
        ));
  }
}
