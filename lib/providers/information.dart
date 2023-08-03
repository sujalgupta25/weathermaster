import 'package:http/http.dart' as http;
import 'dart:convert';

class information {
  String location;

  //information({requithis.location});

  information(this.location, this.air_speed, this.description, this.humidity,
      this.icon, this.main, this.temp);

  String temp;
  String humidity;
  String air_speed;
  String description;
  String main;
  String icon;

  Future<void> getData() async {
    try {
      final url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=3c7435185a1079e6a47cbee0fe7105b2');
      final respone = await http.get(url);

      Map data = json.decode(respone.body);
      if (data["cod"] != "404") {
        //temp,humidity
        Map temp_data = data['main'];
        String gethumidity = temp_data['humidity'].toString();
        double gettemp = temp_data['temp'] - 273.15;

        //desc,main
        List weather = data['weather'];
        var weather_main_data = weather[0];
        String getMain_des = weather_main_data['main'];
        String getDesc = weather_main_data["description"];
        String getIcon = weather_main_data['icon'];

        //air_speed
        Map value = data['wind'];
        double speed = value['speed'] / 0.27777777777778;

        temp = gettemp.toString();
        humidity = gethumidity;
        air_speed = speed.toString();
        description = getDesc;
        main = getMain_des;
        icon = getIcon.toString();
      } else {
        temp = "NA";
        humidity = "NA";
        air_speed = "NA";
        description = "Can't Find Data";
        main = "NA";
        icon = "09d";
      }
    } catch (error) {
      throw error;
    }
  }
}
