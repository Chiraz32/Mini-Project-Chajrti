import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrdersList_Seller extends StatefulWidget {
  const OrdersList_Seller({super.key});

  @override
  State<OrdersList_Seller> createState() => _OrdersList_SellerState();
}

class _OrdersList_SellerState extends State<OrdersList_Seller> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
   
      ),
      bottomNavigationBar: BottomBar(
        isClient: false,
      ),
    );
  }
}