import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:chajrti/Constants/constants.dart';

final ButtonStyle button = ElevatedButton.styleFrom(
    minimumSize: Size(200, 45),
    primary: mainGreen,
    elevation: 0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30))));

final ButtonStyle buttonSupp = ElevatedButton.styleFrom(
    minimumSize: Size(200, 45),
    primary: Color.fromARGB(255, 252, 77, 64),
    elevation: 0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30))));
