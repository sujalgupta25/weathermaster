import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Greetings extends StatefulWidget {
  const Greetings({super.key});

  @override
  State<Greetings> createState() => _GreetingsState();
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

class _GreetingsState extends State<Greetings> {
  @override
  Widget build(BuildContext context) {
    String message = greeting();
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm a').format(now);
    String formattedDate = formatter.format(now);
    return Container(
      height: 80,
      padding: (EdgeInsets.all(15)),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (message == "Good Morning") ...[
            Icon(
              Icons.wb_sunny_outlined,
              color: Colors.redAccent,
              size: 50,
            ),
          ] else if (message == "Good Afternoon") ...[
            Icon(
              Icons.wb_sunny_sharp,
              color: Colors.red,
            ),
          ] else ...[
            Icon(
              Icons.nights_stay_sharp,
              color: Colors.grey,
            ),
          ],
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,$message!",
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 54, 116, 147),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "$formattedDate,$formattedTime",
                style: TextStyle(
                    color: Color.fromARGB(255, 45, 95, 121), fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
