import 'package:chajrti/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomBar extends StatefulWidget {
  late bool isClient;
  BottomBar({super.key, required bool isClient});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool homeClicked = false;
  bool profileClicked = false;
  bool ordersListClicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        height: 60,
        decoration: BoxDecoration(
          color: mainGreen,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  profileClicked = true;
                  Navigator.pushNamed(context, '/ProfileEdit');
                });
              },
              icon: profileClicked == true
                  ? const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  homeClicked = true;
                  widget.isClient == true
                      ? Navigator.pushNamed(context, '/ProductList_Client')
                      : Navigator.pushNamed(context, '/ProductList_Seller');
                });
              },
              icon: homeClicked == true
                  ? const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  ordersListClicked = true;
                  widget.isClient == true
                      ? Navigator.pushNamed(context, '/OrdersList_Client')
                      : Navigator.pushNamed(context, '/OrdersList_Seller');
                });
              },
              icon: ordersListClicked == true
                  ? const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
          ],
        ));
  }
}
