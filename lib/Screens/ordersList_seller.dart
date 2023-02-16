import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/OrderCard.dart';
import 'package:flutter/material.dart';


class OrdersList_Seller extends StatefulWidget {
  const OrdersList_Seller({super.key});

  @override
  State<OrdersList_Seller> createState() => _OrdersList_SellerState();
}

class _OrdersList_SellerState extends State<OrdersList_Seller> {
  @override
  Widget build(BuildContext context) {
//  var ordersList = context.watch<OrderProvider>().ordersList;
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
        body: ListView.builder(
          itemCount: orders.length -1,
          itemBuilder: ((context, ind) {
            return OrderCard(image: orders[ind].plant.image,
             price: orders[ind].plant.price, 
             plant: orders[ind].plant.name, 
             ClientId: orders[ind].client.toString()
            );
          }),
        )
        ,
        bottomNavigationBar: BottomBar(
          isClient: false,
        ));
  }
}
