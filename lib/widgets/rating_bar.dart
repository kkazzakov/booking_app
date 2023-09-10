import 'package:flutter/material.dart';
import 'package:booking_app/theme/color.dart';

class RatingBar extends StatelessWidget {
  final int rating;
  final String ratingName;
  const RatingBar({required this.rating, required this.ratingName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.yellow,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text('★ $rating $ratingName', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.orange),),
    );
  }
}
