import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_forecast/exceptions/local_not_found_exception.dart';
import 'package:weather_forecast/models/current_weather.dart';

class WeatherForecastApiService {
  Future<List<CurrentWeather>?> getWeatherForecast(String? location) async {
    Uri uri = Uri.parse(
      "https://api.openweathermap.org/data/2.5/forecast?q=$location&units=metric&lang=pt_br&appid=367f9277611c3063a6bc21469f096615",
    );
    http.Response response = await http.get(uri);

    Map<String, dynamic> weatherData = jsonDecode(response.body);

    if (response.statusCode == 404) {
      throw LocalNotFoundException();
    }

    List<CurrentWeather>? weatherForecast = [];

    for (int i = 0; i < weatherData["list"].length; i++) {
      DateTime currentListDay =
          DateTime.parse(weatherData["list"][i]["dt_txt"]);

      if (i == 0) {
        continue;
      }

      DateTime lastListDay =
      DateTime.parse(weatherData["list"][i - 1]["dt_txt"]);

      if (currentListDay.day != lastListDay.day) {
        weatherForecast.add(CurrentWeather.fromJson(weatherData["list"][i]));
      }
    }

    return weatherForecast;
  }
}