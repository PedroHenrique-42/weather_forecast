import 'package:flutter/material.dart';
import 'package:weather_forecast/components/custom_card.dart';
import 'package:weather_forecast/models/current_weather.dart';

class AdditionalInformationsCard extends StatelessWidget {
  final CurrentWeather weatherData;

  const AdditionalInformationsCard(
    this.weatherData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
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
            // Row(
            //   children: [
            //     const Icon(Icons.feed, color: Colors.blue),
            //     Text(
            //       " Sensação térmica: ${weatherData.feelsLike}°C",
            //       style: Theme.of(context).textTheme.headlineSmall,
            //     ),
            //   ],
            // ),
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
