import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherData;

  String? cityName;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }
// we made the weatherModel up nullable so the getter wants it also to be nullable
// and as the getter and setter works together the setter that sets the value must
// be nullable which mean that it can set the value to null
  WeatherModel? get weatherData => _weatherData;
}