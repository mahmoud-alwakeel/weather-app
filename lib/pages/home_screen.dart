import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_screen.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // we can comment this as we have a global variable with the sa e name in the searchScreen
  //WeatherModel? weatherData;

  void updateUI(){
    setState(() {

    });
  }
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
                return SearchScreen(updateUI: updateUI,);
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: const Text('Weather'),
      ),
      body: Provider.of<WeatherProvider>(context, listen: true).weatherData == null ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'There is no weather \nStart searching now',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ) : Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2,),
            const Text('London', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            const Text('updated: 11:30',style: TextStyle(fontSize: 22)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/cloudy.png'),
                const Text('11',style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                Column(
                  children: const [
                    Text('max: 17'),
                    Text('min: 9'),
                  ],
                )
              ],
            ),
            const Spacer(),
            const Text('Cloudy',style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const Spacer(flex: 5,),
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
