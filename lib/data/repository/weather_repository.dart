import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository{
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<List<WeatherModel>> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      var list = json.decode(weatherData)['list'];
      List<WeatherModel> weatherList = list.map<WeatherModel>((obj) => WeatherModel.fromJson(obj)).toList();
      return weatherList;

    } catch (e) {
      throw e.toString();
    }
  }
}