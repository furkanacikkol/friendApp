import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';



class WeatherDisplayData {
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({@required this.weatherIcon, @required this.weatherImage});
}

class WeatherData {

//  LocationHelper locationData;
  double currentTemperature;
  int currentCondition;

  Future<void> getCurrentTemperature() async {
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Konya&appid=78af431771f98462f947befff502517c&units=metric'));

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
      } catch (e) {
        print(e);
      }
    } else {
      print('Could not fetch temperature!');
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition < 600) {
      return WeatherDisplayData(
        weatherIcon: Icon(
          FontAwesomeIcons.cloud,
          size: 75.0,
        ),
        weatherImage: AssetImage('assets/images/cloud.png'),
      );
    } else {
      var now = new DateTime.now();

      if (now.hour >= 15) {
        return WeatherDisplayData(
          weatherImage: AssetImage('assets/images/night.png'),
          weatherIcon: Icon(
            FontAwesomeIcons.moon,
            size: 75.0,
            color: Colors.white,
          ),
        );
      } else {
        return WeatherDisplayData(
          weatherIcon: Icon(
            FontAwesomeIcons.sun,
            size: 75.0,
            color: Colors.white,
          ),
          weatherImage: AssetImage('assets/images/sunny.png'),
        );
      }
    }
  }
}