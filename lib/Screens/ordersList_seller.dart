import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Providers/order_provider.dart';
import 'package:chajrti/Providers/user_provider.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/OrderCard.dart';
import 'package:chajrti/Widgets/OrderCardSeller.dart';
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
                  return OrderCardSeller(
                    order :snapshot.data![index],
        
                    token : auth.user.token
                    );
                }
                  );
            } else {
                 return  Container (
                  alignment :Alignment.center,
                  color: lightGreen,
                  child: const Text(" Vous n'avez pas encore de commandes  ",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                  color: Color(0xff00703C),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  )
                  ,));
              }
             }
                ),
    
        bottomNavigationBar: BottomBar(
          isClient: false,
        ));
  }
}
