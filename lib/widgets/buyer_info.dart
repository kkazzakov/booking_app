import 'package:flutter/material.dart';
import 'package:booking_app/theme/color.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:email_validator/email_validator.dart';

class BuyerInfo extends StatefulWidget {
  const BuyerInfo({Key? key}) : super(key: key);

  @override
  _BuyerInfoState createState() => _BuyerInfoState();
}

class _BuyerInfoState extends State<BuyerInfo> {
  bool _validateEmail = false;
  bool _validatePhone = false;
  var phoneFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Информация о покупателе',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 19,),
            Form(
              autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
                inputFormatters: [phoneFormatter], // Phone number mask
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: !_validatePhone
                        ? AppColor.background2
                        : Color(0x26EB5757),
                    labelText: 'Номер телефона',
                    labelStyle: TextStyle(color: Color(0xFFA9ABB7))),
                onChanged: (value) {
                  setState(() {
                    _validatePhone = !phoneFormatter.isFill();
                  });
                },
              ),
            ),
            SizedBox(height: 8),
            Form(
              autovalidateMode:
                  AutovalidateMode.always, // Enable automatic validation
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: !_validateEmail
                        ? AppColor.background2
                        : Color(0x26EB5757),
                    labelText: 'Почта',
                    labelStyle: TextStyle(color: Color(0xFFA9ABB7))),
                onChanged: (value) {
                  setState(() {
                    _validateEmail = !EmailValidator.validate(value);
                  });
                },
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту.',
              style: TextStyle(
                color: Color(0xff828796),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
