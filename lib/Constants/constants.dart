import 'package:chajrti/Models/Plant.dart';
import 'package:chajrti/Models/order.dart';
import 'package:flutter/material.dart';

Color mainGreen = const Color(0xff00703C);
Color mediumGreen = const Color(0xff80B89E);
Color lightGreen = const Color(0xffC0DCCF);
Color lighterGreen = const Color(0xffF2F4F3);
Color grey = const Color(0xffEFEFEF);
Color darkGrey = const Color.fromARGB(255, 111, 111, 111);

List<Plant> plants = [
  Plant(
      id: 1,
      name: "Cactus",
      image: "assets/kaktus.png",
      description:
          "Les Cactus, Cactées ou encore Cactacées (Cactaceae) sont une famille de plantes à fleurs. Ce sont presque toutes des plantes grasses ou plantes succulentes, c'est-à-dire des plantes xérophytes qui stockent dans leurs tissus des réserves de « suc » pour faire face aux longues périodes de sécheresse.",
      price: 48,
      ),
  Plant(
      id: 2,
      name: "Figuier à feuilles de violon",
      image: "assets/fiddle_leaf.png",
      description:
          "Le figuier à feuilles de violon (Ficus lyrata) est un arbre d'intérieur populaire qui possède de très grandes feuilles en forme de violon, très nervurées et brillantes, qui poussent verticalement sur un tronc épuré.",
      price: 50,
      ),
  Plant(
      id: 3,
      name: "Orchidée rose ",
      image: "assets/pink_orchid_flower.png",
      description:
          "Les orchidées roses sont une merveilleuse façon d'envoyer votre amour à un ami ou à une personne importante. Nous proposons de petites plantes d'orchidées roses, de grandes orchidées roses et des tiges d'orchidées roses qui s'épanouissent dans un bouquet. ",
      price: 55,
        ),
];
List<Order> orders = [
  Order(id: 1, state: "en attente", plant: plants[1], clientId: "client01 "),
  Order(id: 2, state: "refusée", plant: plants[2], clientId: "client02 "),
  Order(id: 3, state: "acceptée", plant: plants[0], clientId: "client03 "),

     
 
];
