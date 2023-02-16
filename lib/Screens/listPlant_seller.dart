
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/gridTilesPlants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../Models/Plant.dart';
import '../Providers/favoris_provider.dart';
import '../Providers/user_provider.dart';

class PlantList_Seller extends StatefulWidget {
  const PlantList_Seller({super.key});

  @override
  State<PlantList_Seller> createState() => _PlantList_SellerState();
}

class _PlantList_SellerState extends State<PlantList_Seller> {
  @override
  Widget build(BuildContext context) {
    FavoriteProvider prov = Provider.of<FavoriteProvider>(context);
    UserProvider auth = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("  Vos Produits",
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
                    Navigator.pushNamed(context, '/AddPlant_Seller');
                  });
                },
                icon: const Icon(Icons.add_circle_outline,
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
                  padding: EdgeInsets.all(10),
                  children: List<Widget>.generate(snapshot.data!.length, (index) {
                    return GridTile(
                        child: GridTilesPlants(
                      name: snapshot.data![index].name,
                      image: snapshot.data![index].image,
                      price: snapshot.data![index].price.toString(),
                      index: index,
                    ));
                  }),
                );
              } else {
                return Text("no data");
              }
            }),
        bottomNavigationBar: BottomBar(
          isClient: false,
        ));
  }
}
//  appBar: AppBar(
//         elevation: 0,
//         title: const Text("  Vos Produits",
//             style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.black)),
//         actions: <Widget>[
//           Padding(padding: EdgeInsets.only(right: 20)
//           ,
//           child:IconButton(
//             onPressed: () {
//               setState(() {
//                 Navigator.pushNamed(context, '/AddPlant_Seller');
//               });
//             },
//             icon: const Icon(Icons.add_circle_outline, color: Colors.black,size:30),
//           ) ,)
          
//         ],
//         backgroundColor: Colors.white,
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         crossAxisSpacing: (plants.length) / 2,
//         mainAxisSpacing: (plants.length) / 2,
//         shrinkWrap: true,
//         children: List<Widget>.generate(plants.length, (index) {
//       return GridTile(
//           child: GridTilesPlants(
           
//         name: plants[index].name,
//         image: plants[index].image,
//         price: plants[index].price.toString(),
//       ));
//     }),
//       ),

//       bottomNavigationBar: BottomBar(
//         isClient: false,
//       )
//       )
//       ;
    
