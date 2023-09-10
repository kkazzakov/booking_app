import 'package:booking_app/theme/color.dart';
import 'package:booking_app/widgets/room_info.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/widgets/button.dart';
import 'package:booking_app/widgets/app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:booking_app/utils/room.dart';


class RoomPickScreen extends StatefulWidget {
  @override
  _RoomPickScreenState createState() => _RoomPickScreenState();
}

class _RoomPickScreenState extends State<RoomPickScreen> {
  List<Room> rooms = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse('https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final roomsJson = jsonData['rooms'];

      setState(() {
        rooms = roomsJson
            .map<Room>((roomJson) => Room.fromJson(roomJson))
            .toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Steigenberger Makadi'),
      body: Container(
        color: AppColor.background2,
        child: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            final room = rooms[index];
            return RoomInfo(id: room.id, name: room.name, price: room.price, pricePer: room.pricePer, peculiarities: room.peculiarities, imageUrls: room.imageUrls);
          },
        ),
      ),
    );
  }
}