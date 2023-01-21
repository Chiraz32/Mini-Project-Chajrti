import 'package:chajrti/Providers/favoris_provider.dart';
import 'package:chajrti/Screens/addPlant_seller.dart';
import 'package:chajrti/Screens/editProfil.dart';
import 'package:chajrti/Screens/listPlant_client.dart';
import 'package:chajrti/Screens/listPlant_seller.dart';
import 'package:chajrti/Screens/login.dart';
import 'package:chajrti/Screens/ordersList_client.dart';
import 'package:chajrti/Screens/favourite_plant.dart';
import 'package:chajrti/Screens/ordersList_seller.dart';
import 'package:provider/provider.dart';
import 'Screens/plantDetail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChangeNotifierProvider<FavoriteProvider>(
    child: MyApp(),
    create: (_) => FavoriteProvider(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/ProductList_Client',
        routes: {
          '/Login': (context) => const LoginPage(),
          '/ProductList_Client': (context) => const PlantsList_Client(),
          '/OrdersList_Client': (context) => const OrdersList_Client(),
          '/ProfileEdit': (context) => const EditProfile(),
          '/ProductList_Seller': (context) => const PlantList_Seller(),
          '/OrdersList_Seller': (context) => const OrdersList_Seller(),
          '/AddPlant_Seller': (context) => const AddPlant_Seller(),
          '/FavouriteList_Client': (context) => const FavouriteList(),
          '/PlantDetail_Client': (context) => PlantDetail(index: 2)
        },
        title: 'Chajrti');
  }
}
