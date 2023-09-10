import 'package:booking_app/theme/color.dart';

import 'package:flutter/material.dart';

class DepartureInfo extends StatelessWidget {
  final departure, arrival_country, tourDateStart, tourDateStop, numberOfNights, room, nutrition;

  const DepartureInfo({
    required this.departure,
    this.arrival_country,
    this.tourDateStart,
    this.tourDateStop,
    this.room,
    this.nutrition,
    this.numberOfNights,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Вылет из',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.text2,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Страна, город',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.text2,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Даты',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.text2,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Кол-во ночей',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.text2,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Отель',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.text2,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Номер\n',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.text2,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Питание',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.text2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    departure,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor.text,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    arrival_country,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor.text,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    '$tourDateStart - $tourDateStop',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor.text,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    '$numberOfNights ночей',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor.text,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Steigenberger Makadi',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor.text,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    room,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor.text,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    nutrition,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
