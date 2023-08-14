import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
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
            onSubmitted: (data){
              cityName = data;
              WeatherServices weatherServices = WeatherServices();
              weatherServices.getWeather(cityName: cityName!);
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
