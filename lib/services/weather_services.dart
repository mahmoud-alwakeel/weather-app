import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '0a9744d80d9d4ef0b49182803231408';

  Future<WeatherModel?> getWeather({required String cityName}) async{
    WeatherModel? weatherModel;
    try{
      Uri uri = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&aqi=no');
      http.Response response = await http.get(uri);

      Map<String, dynamic> data = jsonDecode(response.body);

       weatherModel = WeatherModel.fromJson(data);
    }catch(e){
      print(e);
    }

    return weatherModel;
  }
}