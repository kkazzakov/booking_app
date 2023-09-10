import 'package:booking_app/theme/color.dart';
import 'package:flutter/material.dart';

class TouristInput extends StatefulWidget {
  @override
  _TouristInputState createState() => _TouristInputState();
}

class _TouristInputState extends State<TouristInput> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: EdgeInsets.all(0),
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  'Первый турист',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              );
            },
            body: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Имя',
                          filled: true,
                          fillColor: AppColor.background2,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    margin: EdgeInsets.only(bottom: 8),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Фамилия',
                          filled: true,
                          fillColor: AppColor.background2,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Дата рождения',
                          filled: true,
                          fillColor: AppColor.background2,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Гражданство',
                          filled: true,
                          fillColor: AppColor.background2,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Номер загранпаспорта',
                          filled: true,
                          fillColor: AppColor.background2,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                  ),
                  TextField(
                      decoration: InputDecoration(
                    labelText: 'Срок действия загранпаспорта',
                    filled: true,
                    fillColor: AppColor.background2,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
                ],
              ),
            ),
            isExpanded: _isExpanded,
          ),
        ],
        expansionCallback: (int index, bool isExpanded) {
          //
          setState(() {
            _isExpanded = !isExpanded;
          });
        },
      ),
    );
  }
}
