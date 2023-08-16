import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchScreen extends StatelessWidget {
  String? cityName;

  VoidCallback? updateUI;

  SearchScreen({required this.updateUI});
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
            onChanged: (data){
              cityName = data;
            },
            // onSubmitted is when i finish the word and press search
            // while onChanged when i right a new letter it's updated ex: google search
            onSubmitted: (data) async{
              cityName = data;
              WeatherServices weatherServices = WeatherServices();
              WeatherModel? weather = await weatherServices.getWeather(cityName: cityName!);
              //print(weatherModel);
              Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
              //updateUI!();
              Navigator.pop(context);

            },
            decoration: InputDecoration(
              hintText: 'enter a city',
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherServices weatherServices = WeatherServices();
                  WeatherModel? weather = await weatherServices.getWeather(cityName: cityName!);
                  //print(weatherModel);
                  Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
                  //updateUI!();
                  Navigator.pop(context);
                },
                  child: Icon(Icons.search)),
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
