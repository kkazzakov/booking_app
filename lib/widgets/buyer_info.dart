import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/theme/color.dart';

class BuyerInfo extends StatelessWidget {
  const BuyerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 232,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Информация о покупателе',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 22),
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: AppColor.background2),
            ),
            Text(
              'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
              style: TextStyle(
                  color: Color(0xff828796),
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
