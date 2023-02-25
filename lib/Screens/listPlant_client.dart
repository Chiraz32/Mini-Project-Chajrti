
import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Models/Plant.dart';
import 'package:chajrti/Providers/favoris_provider.dart';
import 'package:chajrti/Widgets/gridTilesPlants.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/user_provider.dart';

class PlantList_Client extends StatefulWidget {
  const PlantList_Client({super.key});

  @override
  State<PlantList_Client> createState() => _PlantsList_ClientState();
}

class _PlantsList_ClientState extends State<PlantList_Client> {
  @override
  Widget build(BuildContext context) {
    FavoriteProvider prov = Provider.of<FavoriteProvider>(context);
    UserProvider auth = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("  Liste des produis",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    prov.getAllFavoris(auth.user.token);
                    Navigator.pushNamed(context, '/FavouriteList_Client');
                  });
                },
                icon: const Icon(Icons.favorite_outline,
                    color: Colors.black, size: 30),
              ),
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder<List<Plant>>(
            future: prov.getAllPlants(auth.user.token),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: (snapshot.data!.length) / 2,
                  mainAxisSpacing: (snapshot.data!.length) / 2,
                  shrinkWrap: true,
                  childAspectRatio: (185 / 225),
                  padding: const EdgeInsets.all(10),
                  children:
                      List<Widget>.generate(snapshot.data!.length, (index) {
                    return GridTile(
                        child: GridTilesPlants(
                      name: snapshot.data![index].name,
                      image: (snapshot.data![index].image),
                      price: snapshot.data![index].price.toString(),
                      plant:snapshot.data![index],
                      isClient : true,
                    ));
                  }),
                );
              } else {
               return  Container (
                  alignment :Alignment.center,
                  color: lightGreen,
                  child: const Text("Il n'y a pas encore de plantes publiées  ",
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
