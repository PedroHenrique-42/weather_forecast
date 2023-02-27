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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.bookmark_added_rounded, color: Colors.blue),
            Text(
              " Temperatura mínima: ${weatherData.tempMin}°C",
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.bookmark_remove_rounded, color: Colors.blue),
            Text(
              " Temperatura máxima: ${weatherData.tempMax}°C",
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.water_drop, color: Colors.blue),
            Text(
              " Humidade: ${weatherData.humidity}%",
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
