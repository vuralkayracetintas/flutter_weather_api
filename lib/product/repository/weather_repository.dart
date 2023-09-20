import 'dart:convert';

import 'package:flutter_weather_api/product/model/weather_model.dart';
import 'package:http/http.dart' as hhtp;

class WeatherRepository {
  final _url =
      'https://api.openweathermap.org/data/2.5/weather?q=London&appid=7d4cd8b46fd6f7ff969096ae99462706&units=metric';
  Future<WeatherModel> getWeatherData() async {
    var response = await hhtp.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
