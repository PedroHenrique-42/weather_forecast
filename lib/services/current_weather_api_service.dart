import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:weather_forecast/exceptions/local_not_found_exception.dart';
import 'package:weather_forecast/models/weather_model.dart';

@GenerateMocks([CurrentWeatherApiService])
class CurrentWeatherApiService {
  Future<WeatherModel?> getCurrentWeather(String? location) async {
    Uri uri = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$location&lang=pt_br&units=metric&appid=367f9277611c3063a6bc21469f096615",
    );
    http.Response response = await http.get(uri);

    Map<String, dynamic> weatherData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(weatherData);
    }

    throw LocalNotFoundException();
  }
}
