import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast/models/weather_model.dart';
import 'package:weather_forecast/utils/get_icon_asset.dart';

class BasicInformationsWidget extends StatelessWidget {
  final WeatherModel weatherData;

  const BasicInformationsWidget(this.weatherData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "${weatherData.localName}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 150,
          width: 150,
          child: Lottie.asset(
            GetIconAsset.getIcon(
              weatherData.iconId.toString(),
              weatherData.weatherState.toString(),
            ),
          ),
        ),
        Text(
          "${weatherData.temperature!.toInt()}°C",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
