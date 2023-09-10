import 'package:flutter/material.dart';
import 'package:booking_app/theme/color.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 48),
          backgroundColor: AppColor.button,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)),
        ),
        child: Text(
          '$text',
          style: TextStyle(
              color: AppColor.background,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ));
  }
}
