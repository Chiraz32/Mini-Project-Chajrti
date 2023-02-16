import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Providers/order_provider.dart';
import 'package:chajrti/Providers/user_provider.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/OrderCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/order.dart';

class OrdersList_Seller extends StatefulWidget {
  const OrdersList_Seller({super.key});

  @override
  State<OrdersList_Seller> createState() => _OrdersList_SellerState();
}

class _OrdersList_SellerState extends State<OrdersList_Seller> {
  @override
  Widget build(BuildContext context) {
    OrderProvider prov = Provider.of<OrderProvider>(context);
    UserProvider auth = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: BackButton(color: Colors.black),
            title: const Text(
              "   Liste des commandes ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            )),
        body: FutureBuilder<List<Order>>(
          future: prov.getAllOrders(auth.user.token),
          builder:(context, snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done){
              debugPrint("orders num"+snapshot.data!.length.toString());
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return OrderCard(
                    image: snapshot.data![index].plant.image,
                    price: snapshot.data![index].plant.price,
                    plant: snapshot.data![index].plant.name,
                    ClientId: snapshot.data![index].client.name
                    );
                }
                  );
            } else {
                return Text("no data");
              }
             }
                ),
        // ListView.builder(
        //   itemCount: orders.length - 1,
        //   itemBuilder: ((context, ind) {
        //     return OrderCard(
        //         image: orders[ind].plant.image!,
        //         price: orders[ind].plant.price,
        //         plant: orders[ind].plant.name,
        //         ClientId: orders[ind].client.toString());
        //   }),
        // ),
        bottomNavigationBar: BottomBar(
          isClient: false,
        ));
  }
}
