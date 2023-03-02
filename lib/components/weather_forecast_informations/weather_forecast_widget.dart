import 'package:flutter/material.dart';
import 'package:weather_forecast/components/weather_forecast_informations/weather_forecast_card_widget.dart';
import 'package:weather_forecast/models/weather_model.dart';

import '../custom_card_widget.dart';

class WeatherForecastWidget extends StatelessWidget {
  final Future<List<WeatherModel>?> future;

  const WeatherForecastWidget({Key? key, required this.future})
      : super(key: key);

  Future<List<WeatherModel>?> getWeatherForecast(BuildContext context) async {
    List<WeatherModel>? weatherForecastData;

    weatherForecastData = await future;
    return weatherForecastData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeatherForecast(context),
      builder: (context, weatherDataResult) {
        List<WeatherModel>? weatherForecastData = weatherDataResult.data;

        if (weatherDataResult.connectionState == ConnectionState.done &&
            weatherForecastData != null) {
          return CustomCardWidget(
            key: const Key("WeatherForecastCard"),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: weatherForecastData.map((weatherData) {
                  return WeatherForecastCardWidget(weatherData: weatherData);
                }).toList(),
              ),
            ),
          );
        } else {
          return const SizedBox(key: Key("WeatherForecastSizedBox"));
        }
      },
    );
  }
}
