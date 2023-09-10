import 'package:flutter/material.dart';
import 'package:booking_app/theme/color.dart';

class PriceCalculation extends StatelessWidget {
  final  tour_price, fuel_charge, service_charge;

  const PriceCalculation({required this.tour_price, required this.fuel_charge, required this.service_charge});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Тур', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColor.text2),),
                Text('${tour_price.toString().substring(0,3)}  ${tour_price.toString().substring(3,6)} ₽', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.text),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Топливный сбор', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColor.text2),),
                Text('${fuel_charge} ₽', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.text),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Сервисный сбор', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColor.text2),),
                Text('${service_charge} ₽', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.text),)
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('К оплате', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColor.text2),),
                Text('${(tour_price+fuel_charge+service_charge).toString().substring(0,3)}  ${(tour_price+fuel_charge+service_charge).toString().substring(3,6)} ₽', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.button),)
              ],
            ),
          )

        ],
      ),
    );
  }
}
