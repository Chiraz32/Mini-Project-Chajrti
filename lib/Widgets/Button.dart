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

final ButtonStyle buttonSmall = ElevatedButton.styleFrom(
    minimumSize: Size(75, 40),
    primary: darkGrey,
    elevation: 0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30))));
