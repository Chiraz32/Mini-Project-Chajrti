import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Providers/order_provider.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/OrderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class OrdersList_Seller extends StatefulWidget {
  const OrdersList_Seller({super.key});

  @override
  State<OrdersList_Seller> createState() => _OrdersList_SellerState();
}

class _OrdersList_SellerState extends State<OrdersList_Seller> {
  @override
  Widget build(BuildContext context) {
 var ordersList = context.watch<OrderProvider>().ordersList;
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
          itemCount: ordersList.length -1,
          itemBuilder: ((context, ind) {
            return OrderCard(image: ordersList[ind].plantId.image!,
             price: ordersList[ind].plantId.price, 
             plant: ordersList[ind].plantId.name, 
             ClientId: ordersList[ind].clientId.toString());
          }),
        )
        ,
        bottomNavigationBar: BottomBar(
          isClient: false,
        ));
  }
}
