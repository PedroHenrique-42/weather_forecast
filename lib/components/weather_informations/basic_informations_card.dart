import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast/components/custom_card.dart';
import 'package:weather_forecast/models/current_weather.dart';

class BasicInformationsCard extends StatelessWidget {
  final CurrentWeather weatherData;

  const BasicInformationsCard(this.weatherData, {Key? key})
      : super(key: key);

  static const Map<String, String> icons = {
    "01d": "https://assets1.lottiefiles.com/packages/lf20_i7ixqfgx.json",
    // Sol
    "01n": "https://assets4.lottiefiles.com/private_files/lf30_8ewr9en7.json",
    // Lua
    "Clouds": "https://assets8.lottiefiles.com/packages/lf20_uuzf4huo.json",
    // Nuvem
    "Rain": "https://assets7.lottiefiles.com/packages/lf20_oAByvh2C1K.json",
    // Chuva
    "Thunderstorm":
        "https://assets2.lottiefiles.com/private_files/lf30_LPtaP2.json",
    // Trovoada
    "Snow": "https://lottie.host/e95e7ad9-2b0a-457e-94c7-db1169f4ab2d/hi9Y7ZU8OO.json",
    // Neve
    "50d": "https://assets2.lottiefiles.com/temp/lf20_kOfPKE.json",
    // Nevoa
    "50n": "https://assets2.lottiefiles.com/temp/lf20_kOfPKE.json",
    // Nevoa
  };

  String getIcon(String iconId, String weatherState) {
    String iconNameReturned = "";

    icons.forEach((key, value) {
      if (key == iconId || key == weatherState) {
        iconNameReturned = value;
      }
    });

    return iconNameReturned;
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 300,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
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
            child: Lottie.network(
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
      ),
    );
  }
}
