import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/weather_model.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/screens/main_screen.dart';
import 'package:weather_forecast/services/current_weather_api_service.dart';
import 'package:weather_forecast/services/weather_forecast_api_service.dart';
import 'package:weather_forecast/themes/main_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherDataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<WeatherModel?> currentWeatherFuture =
        CurrentWeatherApiService().getCurrentWeather(
      Provider.of<WeatherDataProvider>(context).locationName ?? "Brasil",
    );

    Future<List<WeatherModel>?> weatherForecastFuture =
        WeatherForecastApiService().getWeatherForecast(
      Provider.of<WeatherDataProvider>(context).locationName ?? "Brasil",
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      home: MainScreen(
        currentWeatherFuture: currentWeatherFuture,
        weatherForecastFuture: weatherForecastFuture,
      ),
    );
  }
}
