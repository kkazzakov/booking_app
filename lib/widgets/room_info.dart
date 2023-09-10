import 'package:booking_app/screens/booking_screen.dart';
import 'package:booking_app/theme/color.dart';
import 'package:booking_app/widgets/button.dart';
import 'package:booking_app/widgets/images_carousel.dart';
import 'package:flutter/material.dart';

class RoomInfo extends StatelessWidget {
  final int id;
  final String name;
  final int price;
  final String pricePer;
  final List<String> peculiarities;
  final List<String> imageUrls;

  const RoomInfo({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: ImagesCarousel(imageUrls: imageUrls),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          Wrap(
            children: peculiarities
                .map(
                  (peculiarity) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.background3,
                    ),
                    padding: EdgeInsets.all(3),
                    margin: EdgeInsets.only(left: 8, right: 8, bottom: 4),
                    child: Text(
                      peculiarity,
                      style: TextStyle(
                        color: AppColor.text2,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
                color: Color.fromRGBO(13, 114, 255, 0.1),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Подробнее о номере',
                  style: TextStyle(
                      color: AppColor.button,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.button,
                  size: 24,
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              Container(
                margin: EdgeInsets.only(right: 13, top: 16),
                child: Text(
                  '${price.toString().substring(0, 3)} ${price.toString().substring(3, 6)} ₽',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: Text(
                  '${pricePer}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor.text2),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
              child: CustomButton(
            text: 'Выбрать номер',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen()));
            },
          ))
        ],
      ),
    );
  }
}
