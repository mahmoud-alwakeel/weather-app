import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherCondition;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    //print(jsonData);
    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherCondition: jsonData['condition']['text']);
  }

  String getImage(){
    if(weatherCondition == 'Clear' || weatherCondition == 'Sunny'){
      return 'assets/images/clear.png';
    } else if(weatherCondition == 'Sleet' || weatherCondition == 'Snow' || weatherCondition == 'Hail'){
      return 'assets/images/snow.png';
    } else if(weatherCondition == 'Light Rain' || weatherCondition == 'Heavy Rain' || weatherCondition == 'Showers'){
      return 'assets/images/rainy.png';
    } else if(weatherCondition == 'ThunderStorm') {
      return 'assets/images/thunderstorm.png';
    } else if(weatherCondition == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    }else {
      return 'assets/images/thunderstorm.png';
    }
  }

  MaterialColor getThemeColor(){
    if(weatherCondition == 'Clear' || weatherCondition == 'Sunny'){
      return Colors.orange;
    } else if(weatherCondition == 'Sleet' || weatherCondition == 'Snow' || weatherCondition == 'Hail'){
      return Colors.blue;
    } else if(weatherCondition == 'Light Rain' || weatherCondition == 'Heavy Rain' || weatherCondition == 'Showers'){
      return Colors.blueGrey;
    } else if(weatherCondition == 'ThunderStorm') {
      return Colors.blueGrey;
    } else if(weatherCondition == 'Partly cloudy') {
      return Colors.blueGrey;
    }else {
      return Colors.orange;
    }
  }

  @override
  String toString() {
    return 'temp = $temp \n maxtemp = $maxTemp \n mintemp = $minTemp';
  }
}
