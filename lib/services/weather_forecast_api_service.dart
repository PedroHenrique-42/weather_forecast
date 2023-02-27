import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_forecast/exceptions/local_not_found_exception.dart';
import 'package:weather_forecast/models/weather_model.dart';

class WeatherForecastApiService {
  Future<List<WeatherModel>?> getWeatherForecast(String? location) async {
    Uri uri = Uri.parse(
      "https://api.openweathermap.org/data/2.5/forecast?q=$location&units=metric&lang=pt_br&appid=367f9277611c3063a6bc21469f096615",
    );
    http.Response response = await http.get(uri);

    Map<String, dynamic> weatherData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<WeatherModel>? weatherForecast = [];

      for (int i = 0; i < weatherData["list"].length; i++) {
        DateTime currentListDay =
            DateTime.parse(weatherData["list"][i]["dt_txt"]);

        if (currentListDay.hour.toInt() == 12) {
          weatherForecast.add(
            WeatherModel.fromJsonForecast(weatherData["list"][i]),
          );
        }
      }

      return weatherForecast;
    }

    throw LocalNotFoundException();
  }
}
