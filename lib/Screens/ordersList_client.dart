import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Models/order.dart';
import 'package:chajrti/Providers/user_provider.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/OrderCardClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../Providers/order_provider.dart';

class OrdersList_Client extends StatefulWidget {
  const OrdersList_Client({super.key});

  @override
  State<OrdersList_Client> createState() => _OrdersList_ClientState();
}

class _OrdersList_ClientState extends State<OrdersList_Client> {
  @override
  Widget build(BuildContext context) {
    final List<Order> ordersList = orders;
    OrderProvider ord = Provider.of<OrderProvider>(context);
    UserProvider auth = Provider.of<UserProvider>(context);
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
        body: FutureBuilder<List<Order>>(
            future: ord.getAllOrders(auth.user.token),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, ind) {
                  debugPrint("number : "+snapshot.data!.length.toString());
                    return OrderCardClient(
                      image: snapshot.data![ind].plant.image,
                      price: snapshot.data![ind].plant.price,
                      plant: snapshot.data![ind].plant.name,
                      state: snapshot.data![ind].state.toString(),
                    );
                  }),
                );
              } else {
                return Text("no data");
              }
            }),
        bottomNavigationBar: BottomBar(
          isClient: true,
        ));
  }
}
