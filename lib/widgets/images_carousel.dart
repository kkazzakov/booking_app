import 'package:booking_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImagesCarousel extends StatelessWidget {
  final List<String> imageUrls;

  ImagesCarousel({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //margin:  EdgeInsets.fromLTRB(16, 0, 16, 16),
      width: double.infinity,
      height: 257,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.background
      ),
      child: CarouselSlider(
        options: CarouselOptions(height: double.infinity, enableInfiniteScroll: false, viewportFraction: 1.0, enlargeCenterPage: false),
        items: imageUrls.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(i, fit: BoxFit.cover,),
              );
            },
          );
        }).toList(),
      ),
    );
  }

}