import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:weather_forecast/exceptions/local_not_found_exception.dart';
import 'package:weather_forecast/models/weather_model.dart';

@GenerateMocks([WeatherForecastApiService])
class WeatherForecastApiService {
  final String baseUrl =
      "https://api.openweathermap.org/data/2.5/forecast?q=%location&units=metric&lang=pt_br&appid=367f9277611c3063a6bc21469f096615";

  Future<List<WeatherModel>?> getWeatherForecast(String location) async {
    Uri uri = Uri.parse(baseUrl.replaceAll("%location", location));
    http.Response response = await http.get(uri);

    Map<String, dynamic> apiResult = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List weatherDataList = apiResult["list"];
      Map<int, WeatherModel> weatherForecast = {};

      for (var currentForecast in weatherDataList) {
        DateTime forecastDate = DateTime.parse(currentForecast["dt_txt"]);

        if (forecastDate.day != DateTime.now().day &&
            !weatherForecast.containsKey(forecastDate.day)) {
          weatherForecast[forecastDate.day] = WeatherModel.fromJsonForecast(
            currentForecast,
          );
        }
      }

      return weatherForecast.entries.map((forecast) => forecast.value).toList();
    }

    throw LocalNotFoundException();
  }
}
