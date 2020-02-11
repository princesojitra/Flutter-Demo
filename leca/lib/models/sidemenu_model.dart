import 'package:flutter/material.dart';
import 'package:leca/app_screens/dashboard.dart';


class MenuItem {
  String title;
  String image;
  Color color;
  Function function;
  MenuItem({this.title, this.image, this.color, this.function});
}