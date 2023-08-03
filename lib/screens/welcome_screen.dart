import 'package:flutter/material.dart';

import 'package:weather/screens/locations.dart';
import '../providers/information.dart';
import '/models/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/WelcomeScreen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Constants mycon = Constants();

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

    Navigator.pushNamed(context, LoactionScreen.routeName, arguments: {
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Weather Updates",
        textAlign: TextAlign.center,
      )),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: mycon.primaryColor.withOpacity(.3),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/get-started.png'),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  color: mycon.primaryColor,
                ),
                child: OutlinedButton(
                  onPressed: () {
                    startApp("Mumbai");
                  },
                  child: Center(
                    child: Text("Get Weather Updates in your city"),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
