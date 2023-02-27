import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast/models/weather_model.dart';

class BasicInformationsWidget extends StatelessWidget {
  final WeatherModel weatherData;

  const BasicInformationsWidget(this.weatherData, {Key? key}) : super(key: key);

  static const Map<String, String> assetIconsNameMap = {
    "01d": "assets/animations/sun_animation.json",
    "01n": "assets/animations/moon_animation.json",
    "Clouds": "assets/animations/clouds_animation.json",
    "Rain": "assets/animations/rain_animation.json",
    "Thunderstorm": "assets/animations/thunderstorm_animation.json",
    "Snow": "assets/animations/snow_animation.json",
    "50d": "assets/animations/mist_animation.json",
    "50n": "assets/animations/mist_animation.json",
  };

  String getIcon(String iconId, String weatherState) {
    String iconNameReturned = "";

    assetIconsNameMap.forEach((key, value) {
      if (key == iconId || key == weatherState) {
        iconNameReturned = value;
      }
    });

    return iconNameReturned;
  }

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
            getIcon(
              weatherData.iconId.toString(),
              weatherData.weatherState.toString(),
            ),
          ),
        ),
        Text(
          "${weatherData.temperature}°C",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
