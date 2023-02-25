import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Models/Plant.dart';
import 'package:chajrti/Providers/favoris_provider.dart';
import 'package:chajrti/Providers/order_provider.dart';
import 'package:chajrti/Providers/user_provider.dart';

import 'package:chajrti/Widgets/Button.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PlantDetail extends StatefulWidget {
  Plant index;

  PlantDetail({super.key, required this.index});

  @override
  State<PlantDetail> createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<OrderProvider>(context);
    final UserProvider auth = Provider.of<UserProvider>(context);
    final favProv = Provider.of<FavoriteProvider>(context);
    bool isFav = favProv.findFavorisByPlant(widget.index);
    debugPrint("isFav value $isFav");

    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: BackButton(color: darkGrey)),
        body: FutureBuilder<Plant>(
            future: favProv.getPlant(widget.index.id, auth.user.token),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return ListView(children: [
                  Center(
                      child: Image.asset(
                    snapshot.data!.image.isEmpty == true
                        ? "assets/defaultImage.jpg"
                        : "assets/${snapshot.data!.image}",
                    height: 300,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 270,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              snapshot.data!.name,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                          onPressed: () {

                             debugPrint("isFav 1 value $isFav");
                             debugPrint("find favoris result ${favProv.findFavorisByPlant(snapshot.data!)}");
                             
                            if (!favProv.findFavorisByPlant(snapshot.data!)) {
                              setState(() {
                                  isFav = true;
                              });
                        favProv.addFavoris(
                                    snapshot.data!, auth.user.token);
                              
                                Future.delayed(const Duration(milliseconds: 600));
                                Navigator.pushNamed(context, '/FavouriteList_Client');
                             } 
                            else {
                                  isFav = false;
                              
                              debugPrint(isFav.toString());
                                favProv.deleteFavoris(
                                    snapshot.data!, auth.user.token);
                              
                                 Future.delayed(const Duration(milliseconds: 1000));
                                Navigator.pushNamed(context, '/FavouriteList_Client');
                            }
                          },
                          icon: 
                          isFav == true
                              ? const Icon(Icons.favorite,
                                  color: Color(0xff00703C), size: 40)
                              : const Icon(Icons.favorite_outline,
                                  color: Colors.black, size: 40),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Divider(
                        color: Color.fromARGB(161, 98, 98, 98),
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 8),
                    child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          snapshot.data!.description,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                          textAlign: TextAlign.left,
                        )),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Divider(
                        color: Color.fromARGB(161, 98, 98, 98),
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: Text('Prix:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: darkGrey)),
                              ),
                              Text("${snapshot.data!.price} DT",
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: ElevatedButton(
                              style: button,
                              onPressed: () {
                                setState(() {
                                  debugPrint(
                                      snapshot.data!.toJson().toString());
                                  prov.addOrder(
                                      context, snapshot.data!, auth.user.token);
                                  debugPrint("clicked");

                                  Navigator.pushNamed(
                                      context, '/OrdersList_Client');
                                });
                              },
                              child: const Text(
                                'Commander',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              )))
                    ],
                  ),
                ]);
              } else {
                return Text("no data");
              }
            }));
  }
}
