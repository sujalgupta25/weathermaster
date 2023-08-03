import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Temperature extends StatefulWidget {
  //const Temperature({super.key});

  String temp;
  Temperature(this.temp);

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white54,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              WeatherIcons.thermometer,
              size: 40,
              color: Colors.redAccent.withOpacity(0.7),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.temp}",
                style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87.withOpacity(0.7)),
              ),
              Icon(
                Icons.circle_outlined,
                size: 15,
              ),
              Text(
                "C",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45.withOpacity(0.7)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
