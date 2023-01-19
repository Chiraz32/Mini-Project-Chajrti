import 'package:chajrti/Models/Plant.dart';

class Order{

 late int id ;
  late String state;
  late Plant plant;
  late String clientId;
Order({required this.id,required this.state,required this.plant,required this.clientId});
}