import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Models/order.dart';
import 'package:chajrti/Providers/order_provider.dart';
import 'package:chajrti/enum/order_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderCardSeller extends StatefulWidget {
  late Order order;
  late String token;
  OrderCardSeller({super.key, required this.order, required this.token});

  @override
  State<OrderCardSeller> createState() => _OrderCardSellerState();
}

class _OrderCardSellerState extends State<OrderCardSeller> {
  @override
  Widget build(BuildContext context) {
    OrderProvider prov = Provider.of<OrderProvider>(context);
    String image = widget.order.plant.image;
    var state = widget.order.state;
    var color = state == OrderStateEnum.Pending
        ? transparent
        : state == OrderStateEnum.accepted
            ? lightGreen
            : Color.fromARGB(255, 225, 117, 109);
    if (image.isEmpty == true) {
      image = "assets/defaultImage.jpg";
    } else {
      image = "assets/$image";
    }
    debugPrint("image$image");
    return Row(children: [
      const SizedBox(width: 5),
      Container(
              height: 100,
              color: color,
              child:Card(
        elevation: 0,
        color: lighterGreen,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        )),
        child: Image.asset(
          image,
          width: 80,
          height: 80,
        ),
      )),
      Expanded(
          flex: 2,
          child: Container(
              height: 100,
              color: color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text("Plante : ${widget.order.plant.name}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            leadingDistribution: TextLeadingDistribution.even,
                          ),
                          textAlign: TextAlign.center)),
                  Text("Prix : ${widget.order.plant.price} dt",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text("Client : ${widget.order.client.name}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center)),
                ],
              ))),
      Expanded(
          flex: 1,
          child: Container(
              color: color,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        //prov.acceptOrder(widget.order.id,widget.token);
                        setState(() {
                          color = lightGreen;
                          prov.acceptOrder(widget.order.id, widget.token);
                          prov.notifyListeners();
                        });
                      },
                      icon: Icon(Icons.check_circle_outline,
                          color: mainGreen, size: 28)),
                  Padding(
                    padding: const EdgeInsets.only(top: 2,bottom:1),
                    child: IconButton(
                        onPressed: () {
                          prov.refuseOrder(widget.order.id, widget.token);
                          color = Color.fromARGB(255, 225, 117, 109);
                          prov.notifyListeners();
                        },
                        icon: Icon(Icons.remove_circle_outline,
                            color: Colors.red.shade600, size: 28)),
                  )
                ],
              ))),
    ]
    );
  }
}
