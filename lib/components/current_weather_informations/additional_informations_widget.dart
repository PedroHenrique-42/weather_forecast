import 'package:flutter/material.dart';
import 'package:weather_forecast/components/custom_card_widget.dart';
import 'package:weather_forecast/models/weather_model.dart';

class AdditionalInformationsWidget extends StatelessWidget {
  final WeatherModel weatherData;

  const AdditionalInformationsWidget(
    this.weatherData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      height: 150,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.bookmark_added_rounded, color: Colors.blue),
                Text(
                  " Temperatura mínima: ${weatherData.tempMin}°C",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.bookmark_remove_rounded, color: Colors.blue),
                Text(
                  " Temperatura máxima: ${weatherData.tempMax}°C",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.water_drop, color: Colors.blue),
                Text(
                  " Humidade: ${weatherData.humidity}%",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
