import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchScreen extends StatelessWidget {
  String? cityName;

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Which City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            // onSubmitted is when i finish the word and press search
            // while onChanged when i right a new letter it's updated ex: google search
            onSubmitted: (data) async{
              cityName = data;
              WeatherServices weatherServices = WeatherServices();
              WeatherModel weatherModel = await weatherServices.getWeather(cityName: cityName!);
              print(weatherModel);
            },
            decoration: const InputDecoration(
              hintText: 'enter a city',
              suffixIcon: Icon(Icons.search),
              label: Text('search'),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 18)
            ),
          ),
        ),
      ),
    );
  }
}
