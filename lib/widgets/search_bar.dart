import 'package:flutter/material.dart';

import 'package:weather/screens/locations.dart';
import 'package:weather/screens/welcome_screen.dart';

import '../providers/information.dart';

class SearchBox extends StatefulWidget {
  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  //const SearchBox({super.key});
  final TextEditingController _textEditingController =
      new TextEditingController();

  String city = "";
  String temp = "";
  String hum = "";
  String air_speed = "";
  String des = "";
  String main = "";
  String icon = "";

  void startApp(String city) async {
    information loc = information(city, temp, hum, air_speed, des, main, icon);
    await loc.getData();

    temp = loc.temp;
    hum = loc.humidity;
    air_speed = loc.air_speed;
    des = loc.description;
    main = loc.main;
    icon = loc.icon;

    Navigator.pushReplacementNamed(context, LoactionScreen.routeName,
        arguments: {
          "temp_value": temp,
          "hum_value": hum,
          "air_speed_value": air_speed,
          "des_value": des,
          "main_value": main,
          "icon_value": icon,
          "city_value": city,
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black12),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            onTap: () {
              setState(() {
                if ((_textEditingController.text).replaceAll(" ", "") == "") {
                  print("Blank search");
                } else {
                  String text = _textEditingController.text;
                  startApp(text);
                }
              });
            },
          ),
          Padding(padding: EdgeInsets.all(5)),
          Expanded(
              child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "Search your city"),
          ))
        ],
      ),
    );
  }
}
