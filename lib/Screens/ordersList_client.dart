import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Models/order.dart';
import 'package:chajrti/Providers/user_provider.dart';
import 'package:chajrti/Widgets/BottomBar.dart';
import 'package:chajrti/Widgets/OrderCardClient.dart';
import 'package:chajrti/enum/order_state_enum.dart';
import 'package:flutter/material.dart';
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
    OrderProvider ord = Provider.of<OrderProvider>(context);
    UserProvider auth = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: const BackButton(color: Colors.black),
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
                    debugPrint("number : ${snapshot.data!.length}");
                    debugPrint("id order :${snapshot.data![ind].id}");
                    String state = snapshot.data![ind].state ==
                            OrderStateEnum.Pending
                        ? " En Attente "
                        : snapshot.data![ind].state == OrderStateEnum.refused
                            ? " Refusée "
                            : " Acceptée ";
                    dynamic id = snapshot.data![ind].id ;     
                    return Dismissible(
                        key: Key('item ${snapshot.data![ind].id}'),
                        onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.startToEnd) {
                debugPrint('Remove item');
                ord.deleteOrder(id,auth.user.token);
              }
              // setState(() {
              //   ord.removeFromList( snapshot.data![ind]);
              // });
            },
                        direction: DismissDirection.startToEnd,
                        confirmDismiss: (DismissDirection direction) async {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title:
                                    const Text("Confirmation de suppression"),
                                content: const Text(
                                    " Êtes-vous sûr de vouloir supprimer cet élément ?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text("Supprimer"),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text("Annuler"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: OrderCardClient(
                          image: snapshot.data![ind].plant.image,
                          price: snapshot.data![ind].plant.price,
                          plant: snapshot.data![ind].plant.name,
                          state: state,
                        ));
                  }),
                );
              } else {
                return const Text("no data");
              }
            }),
        bottomNavigationBar: BottomBar(
          isClient: true,
        ));
  }
}
