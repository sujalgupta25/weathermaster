import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Humidity_wid extends StatefulWidget {
  //const Humidity_wid({super.key});

  String hum;
  Humidity_wid(this.hum);

  @override
  State<Humidity_wid> createState() => _Humidity_widState();
}

class _Humidity_widState extends State<Humidity_wid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white54,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              WeatherIcons.humidity,
              size: 30,
              color: Colors.lightBlue,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${widget.hum}%",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54.withOpacity(0.7)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
