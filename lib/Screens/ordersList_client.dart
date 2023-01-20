import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Models/order.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/OrderCardClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';



class OrdersList_Client extends StatefulWidget {
  const OrdersList_Client({super.key});

  @override
  State<OrdersList_Client> createState() => _OrdersList_ClientState();
}

class _OrdersList_ClientState extends State<OrdersList_Client> {
  
  @override
  Widget build(BuildContext context) {
    final List<Order> ordersList = orders;

    return Scaffold(
      appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: BackButton(color: Colors.black),
            title: const Text(
              "Vos commandes",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            )),
        body: ListView.builder(
          itemCount: ordersList.length,
          itemBuilder: ((context, ind) {
            return OrderCardClient(image: ordersList[ind].plant.image,
             price: ordersList[ind].plant.price, 
             plant: ordersList[ind].plant.name,
             state: ordersList[ind].state,
             );
          }),
        )
        ,
        bottomNavigationBar: BottomBar(
          isClient: true,
        )
    );
  }
}