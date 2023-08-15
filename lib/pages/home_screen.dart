import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions is an attribute and [] is a list of widgets ,
        // it's used to display widgets at the end of the app bar
        actions: [
          IconButton(
            onPressed: () {
              // Navigator is a statment so it must end with a semicolon
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen();
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: const Text('Weather'),
      ),
      body: weatherData != null ? const NoDataWidget() : Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text('London', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            Text('updated: 11:30',style: TextStyle(fontSize: 22)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/cloudy.png'),
                Text('11',style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                Column(
                  children: [
                    Text('max: 17'),
                    Text('min: 9'),
                  ],
                )
              ],
            ),
            Spacer(),
            Text('Cloudy',style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Spacer(flex: 5,),
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
