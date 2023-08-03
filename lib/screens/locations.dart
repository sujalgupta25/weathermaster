import 'package:flutter/material.dart';

import 'package:weather/providers/information.dart';
import 'package:weather/widgets/search_bar.dart';

import '../models/constants.dart';
import '../widgets/description.dart';
import '../widgets/greetings.dart';
import '../widgets/humidity_wid.dart';
import '../widgets/speed.dart';
import '../widgets/temp.dart';

class LoactionScreen extends StatefulWidget {
  static const routeName = '/LocationScreen';
  const LoactionScreen({super.key});
  @override
  State<LoactionScreen> createState() => _LoactionScreenState();
}

class _LoactionScreenState extends State<LoactionScreen> {
  Constants mycon = Constants();

  @override
  void initState() {
    // TODO: implement initState
    // startApp(city);
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    //startApp(city);
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final info = ModalRoute.of(context)?.settings.arguments as Map;

    String temp = ((info['temp_value']).toString());
    String air = ((info['air_speed_value']).toString());
    if (temp == "NA") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("An error occured"),
            content: Text("Check Your City."),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Okay")),
            ],
          ),
        );
      });
    } else {
      temp = ((info['temp_value']).toString()).substring(0, 4);
      air = ((info['air_speed_value']).toString()).substring(0, 2);
    }
    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String hum = info['hum_value'];
    String des = info['des_value'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          //height: size.height,
          width: size.width,
          color: mycon.primaryColor.withOpacity(.6),
          child: Column(
            children: [
              SearchBox(),
              SizedBox(
                height: 0,
              ),
              Greetings(),
              SizedBox(
                height: 10,
              ),
              Description(icon, des, getcity),
              SizedBox(
                height: 30,
              ),
              Temperature(temp),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Humidity_wid(hum),
                  Speed(air),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
