import 'package:flutter/material.dart';
import 'package:weather_forecast/models/weather_model.dart';

class AdditionalInformationsWidget extends StatelessWidget {
  final WeatherModel weatherData;

  const AdditionalInformationsWidget(
    this.weatherData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Sensação térmica: ${weatherData.feelsLike!.toInt()}°C",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          "Humidade: ${weatherData.humidity}%",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          weatherData.description!.replaceFirst(
            weatherData.description![0],
            weatherData.description![0].toUpperCase(),
          ),
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
