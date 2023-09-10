import 'package:flutter/material.dart';
import 'package:booking_app/theme/color.dart';

class CustomAppBar extends AppBar {
  final String text;
  CustomAppBar({required this.text}) : super(
    leading: const Icon(Icons.arrow_back_ios),
    elevation: 0.0,
    centerTitle: true,
    title:  Text(
      text,
      style: TextStyle(color: AppColor.text, fontWeight: FontWeight.w500),
    ),
  );


}
