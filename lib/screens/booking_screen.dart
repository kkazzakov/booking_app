import 'package:booking_app/screens/booking_complete.dart';
import 'package:booking_app/theme/color.dart';
import 'package:booking_app/widgets/departure_info.dart';
import 'package:booking_app/widgets/price_calculation.dart';
import 'package:booking_app/widgets/rating_bar.dart';
import 'package:booking_app/widgets/tourist_input.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/widgets/app_bar.dart';
import 'package:booking_app/widgets/button.dart';
import 'package:booking_app/widgets/buyer_info.dart';
import 'package:booking_app/utils/tour_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingScreen extends StatefulWidget {
  BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  Future<TourData> fetchTourData() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return TourData.fromJson(jsonData);
    } else {
      throw Exception('Failed to load tour data');
    }
  }

  final GlobalKey<FormState> touristFormKey = GlobalKey<FormState>();
  List<GlobalKey<FormState>> formKeys = []; // Список GlobalKey<FormState>
  int touristsCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Бронирование',
      ),
      body: Container(
        color: AppColor.background2,
        child: FutureBuilder<TourData>(
          future: fetchTourData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No data available');
            } else {
              final tourData = snapshot.data!;
              return ListView(
                children: [
                  Container(
                    height: 120,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: AppColor.background,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingBar(
                            rating: tourData.rating,
                            ratingName: tourData.ratingName),
                        Text(
                          'Steigenberger Makadi',
                          style: TextStyle(
                              color: AppColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(tourData.hotelAddress,
                            style: TextStyle(
                                color: AppColor.button,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  DepartureInfo(
                      departure: tourData.departure,
                      arrival_country: tourData.arrivalCountry,
                      tourDateStart: tourData.tourDateStart,
                      numberOfNights: tourData.numberOfNights,
                      room: tourData.room,
                      nutrition: tourData.nutrition,
                      tourDateStop: tourData.tourDateStop),
                  BuyerInfo(),
                  Column(
                    children: [
                      for (var formKey in formKeys)
                        TouristInput(formKey: formKey),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: AppColor.background,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Добавить туриста',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              touristsCount+=1;
                              formKeys.add(GlobalKey<FormState>());
                            });
                          },
                          icon: SvgPicture.asset("assets/Icons.svg"),
                        )
                      ],
                    ),
                  ),
                  PriceCalculation(
                      tour_price: tourData.tourPrice,
                      fuel_charge: tourData.fuelCharge,
                      service_charge: tourData.serviceCharge),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      color: AppColor.background,
                    ),
                    child: Column(
                      children: [
                        Divider(
                          height: 0,
                          thickness: 1,
                          color: Color(0xFFE8E9EC),
                        ),
                        Container(
                          padding:
                          EdgeInsets.only(top: 12, left: 25, right: 25),
                          child: CustomButton(
                            text:
                            'Оплатить ${(tourData.tourPrice + tourData.fuelCharge + tourData.serviceCharge).toString().substring(0, 3)}  ${(tourData.tourPrice + tourData.fuelCharge + tourData.serviceCharge).toString().substring(3, 6)} ₽',
                            onPressed: () {
                              bool isValid = true;
                              for (var key in formKeys) {
                                if (!key.currentState!.validate()) {
                                  isValid = false;
                                }
                              }

                              if (isValid) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BookingCompleteScreen(),
                                  ),
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
