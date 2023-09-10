import 'package:booking_app/screens/room_pick_screen.dart';
import 'package:booking_app/theme/color.dart';
import 'package:booking_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:booking_app/utils/hotel.dart';
import 'dart:convert';
import 'package:booking_app/widgets/app_bar.dart';
import 'package:booking_app/widgets/images_carousel.dart';
import 'package:booking_app/widgets/rating_bar.dart';
import 'package:booking_app/widgets/about_hotel.dart';

class HotelDataLoader extends StatefulWidget {
  @override
  _HotelDataLoaderState createState() => _HotelDataLoaderState();
}

class _HotelDataLoaderState extends State<HotelDataLoader> {
  Hotel? hotel;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        hotel = Hotel(
          id: jsonData['id'],
          name: jsonData['name'],
          address: jsonData['adress'],
          minimalPrice: jsonData['minimal_price'],
          priceForIt: jsonData['price_for_it'],
          rating: jsonData['rating'],
          ratingName: jsonData['rating_name'],
          imageUrls: List<String>.from(jsonData['image_urls']),
          aboutTheHotel: HotelDescription(
            description: jsonData['about_the_hotel']['description'],
            peculiarities:
            List<String>.from(jsonData['about_the_hotel']['peculiarities']),
          ),
        );
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          text: 'Отель',
        ),
        body: SingleChildScrollView(
          child: Container(
            color: AppColor.background2,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.background,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      )),
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (hotel != null) ...[
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: ImagesCarousel(imageUrls: hotel!.imageUrls),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: RatingBar(
                              rating: hotel!.rating,
                              ratingName: hotel!.ratingName),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 7),
                          child: Text(
                            'Steigenberger Makadi',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 22),
                          ),
                        ),
                        Text(
                          hotel!.address,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColor.button),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 13, top: 16),
                              child: Text(
                                'от ${hotel!.minimalPrice.toString().substring(0, 3)}  ${hotel!.minimalPrice.toString().substring(3, 6)} ₽',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 30),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 2),
                              child: Text(
                                '${hotel!.priceForIt}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColor.text2),
                              ),
                            )
                          ],
                        )
                      ] else ...[
                        Placeholder()
                      ]
                    ],
                  ),
                ),
                AboutHotel(
                    aboutText: hotel != null ? hotel!.aboutTheHotel.description : '',
                    text: hotel != null ? hotel!.aboutTheHotel.peculiarities : []),
                Divider(
                  height: 0,
                  thickness: 1,
                  color: Color(0xFFE8E9EC),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 16, right: 16, bottom: 15, top: 12),
                  color: AppColor.background,
                  child: CustomButton(
                    text: 'К выбору номера',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RoomPickScreen()));
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
