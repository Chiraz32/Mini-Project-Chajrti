import 'package:chajrti/Widgets/BottomBar.dart';
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
    return Scaffold(
      body: Column(),
      bottomNavigationBar: BottomBar(isClient: true),
    );
  }
}
