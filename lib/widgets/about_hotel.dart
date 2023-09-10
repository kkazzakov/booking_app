import 'package:booking_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutHotel extends StatelessWidget {
  final List<String>text;
  final String aboutText;
  const AboutHotel({required this.aboutText, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.background, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Об отеле',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              )),
          Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Wrap(
              children: text
                  .map(
                    (text) => Container(
                      decoration: BoxDecoration(
                        color: AppColor.background3,
                        borderRadius: BorderRadius.circular(5)
                      ),
                  margin: EdgeInsets.only(left: 8, right: 8, bottom: 4),
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: AppColor.text2,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ),
          Text(
            aboutText,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                        'assets/emoji-happy.svg',
                        height: 24,
                        width: 24,
                      ),
                    Container(
                      margin: EdgeInsets.only(left: 12, right: 115),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Удобства',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text(
                            'Самое необходимое',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColor.text2),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],

                ),
                Divider(thickness: 1, color: Color.fromRGBO(130, 135, 150, 0.15), indent: 37,),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/tick-square.svg',
                      height: 24,
                      width: 24,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12, right: 115),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Что включено',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text(
                            'Самое необходимое',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColor.text2),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],

                ),
                Divider(thickness: 1, color: Color.fromRGBO(130, 135, 150, 0.15), indent: 37,),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/close-square.svg',
                      height: 24,
                      width: 24,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12, right: 115),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Что не включено',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text(
                            'Самое необходимое',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColor.text2),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],

                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
