import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Speed extends StatefulWidget {
  //const Speed({super.key});

  String speed;
  Speed(this.speed);

  @override
  State<Speed> createState() => _SpeedState();
}

class _SpeedState extends State<Speed> {
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
              WeatherIcons.windy,
              size: 35,
              color: Colors.lightBlue,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${widget.speed}",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54.withOpacity(0.7)),
              ),
              Text(
                "km/hr",
                style: TextStyle(
                    fontSize: 19,
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
