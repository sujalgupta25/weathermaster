import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  //const Description({super.key});

  String icon;
  String desc;
  String loc;

  Description(this.icon, this.desc, this.loc);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            "http://openweathermap.org/img/wn/${widget.icon}@2x.png",
            color: Colors.blueAccent,
            height: 80,
            width: 80,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.desc}".toUpperCase(),
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "In ${widget.loc}".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
