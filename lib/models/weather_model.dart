class WeatherModel {
   String? date;
   double? temp;
   double? maxTemp;
   double? minTemp;
   String? weatherCondition;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  WeatherModel.fromJson(dynamic data){
    var jsonData = data['forecast']['forecastday'][0];
    date = data['location']['localtime'];
    temp = jsonData['avgtemp_c'];
    maxTemp = jsonData['maxtemp_c'];
    minTemp = jsonData['mintemp_c'];
    weatherCondition = jsonData['condition']['text'];
  }
}
