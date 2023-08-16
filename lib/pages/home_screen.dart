import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_screen.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // we can comment this as we have a global variable with the sa e name in the searchScreen
  //WeatherModel? weatherData;

  void updateUI() {
    setState(() {});
  }

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;
    return Scaffold(
      appBar: AppBar(
        // actions is an attribute and [] is a list of widgets ,
        // it's used to display widgets at the end of the app bar
        actions: [
          IconButton(
            onPressed: () {
              // Navigator is a statment so it must end with a semicolon
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen(
                  updateUI: updateUI,
                );
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'There is no weather \nStart searching now',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherData!.getThemeColor(),
                    weatherData!.getThemeColor()[300]!,
                    weatherData!.getThemeColor()[100]!,
                    Colors.white
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context, listen: true)
                            .cityName ??
                        'Error',
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'Last update : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                      style: const TextStyle(fontSize: 22)),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text((weatherData!.temp.toInt()).toString(),
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600)),
                      Column(
                        children: [
                          Text('max:${weatherData!.maxTemp.toInt()}'),
                          Text('min:${weatherData!.minTemp.toInt()}'),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                      weatherData?.weatherCondition ??
                          'Error getting weather condition',
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold)),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'There is no weather \nStart searching now',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
