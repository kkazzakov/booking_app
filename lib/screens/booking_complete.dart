import 'package:booking_app/theme/color.dart';
import 'package:booking_app/utils/hotel_load.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/widgets/button.dart';
import 'package:booking_app/widgets/app_bar.dart';
class BookingCompleteScreen extends StatelessWidget {
  const BookingCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Закак оплачен',),
      body: Container(
        padding: EdgeInsets.fromLTRB(22.5, 122, 22.5, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(25.0),
                  margin: EdgeInsets.fromLTRB(117.5, 0, 118.5, 32),
                  decoration: BoxDecoration(
                      color: AppColor.background2,
                      borderRadius: BorderRadius.circular(1000)),
                  child: Image(
                      image: AssetImage('assets/images/party_popper.png')),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 19),
                  child: Text(
                    'Ваш заказ принят в работу',
                    style: TextStyle(
                        color: AppColor.text,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                  style: TextStyle(
                      color: AppColor.text2,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Divider(
                  thickness: 1,
                  color: Color(0xFFE8E9EC),
                ),
                CustomButton(text: 'Супер!', onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDataLoader()));
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
