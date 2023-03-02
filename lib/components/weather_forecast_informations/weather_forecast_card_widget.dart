import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast/models/weather_model.dart';
import 'package:weather_forecast/utils/get_icon_asset.dart';
import 'package:weather_forecast/utils/get_week_day.dart';

class WeatherForecastCardWidget extends StatelessWidget {
  final WeatherModel weatherData;

  const WeatherForecastCardWidget({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          GetWeekDay.get(weatherData.dateTime!.weekday),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: Lottie.asset(
            GetIconAsset.getIcon(
              weatherData.iconId.toString(),
              weatherData.weatherState.toString(),
            ),
          ),
        ),
        Text("${weatherData.temperature!.toInt()}°C")
      ],
    );
  }
}
