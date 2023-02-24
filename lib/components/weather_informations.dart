import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/current_weather.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/services/weather_api_service.dart';
import 'package:weather_forecast/utils/show_dialog.dart';

class WeatherInformations extends StatefulWidget {
  const WeatherInformations({Key? key}) : super(key: key);

  @override
  State<WeatherInformations> createState() => _WeatherInformationsState();
}

class _WeatherInformationsState extends State<WeatherInformations> {
  Future<CurrentWeather?> getWeatherData() async {
    CurrentWeather? weatherData;

    weatherData = await WeatherApiService().getCurrentWeather(
      Provider.of<WeatherDataProvider>(context).locationName ?? "Brasil",
    );

    return weatherData;
  }

  Map<String, String> icons = {
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
    "Snow": "https://assets5.lottiefiles.com/temp/lf20_WtPCZs.json",
    // Neve
    "50d": "https://assets2.lottiefiles.com/temp/lf20_kOfPKE.json",
    // Nevoa
    "50n": "https://assets2.lottiefiles.com/temp/lf20_kOfPKE.json",
    // Nevoa
  };

  String getIcon(String iconName, String weatherState) {
    String iconNameReturned = "";

    icons.forEach((key, value) {
      if (key == iconName || key == weatherState) {
        iconNameReturned = value;
      }
    });

    return iconNameReturned;
  }

  Map<String, String> images = {
    "01d":
        "https://media1.popsugar-assets.com/files/thumbor/XdZCH91AHCuEdnfsfTlsf1PjX7U/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2019/07/12/789/n/1922441/f9cc294c34316a54_GettyImages-941097280/i/sunny-day.jpg",
    // Sol
    "01n":
        "https://cdn.pixabay.com/photo/2016/11/25/23/15/moon-1859616__340.jpg",
    // Lua
    "Clouds":
        "https://images.ctfassets.net/yixw23k2v6vo/5BW4fKSOW9MPGLQQNZyXX8/6ceea2f8e0fed31ec258dad79a0bc5ba/agustinus-nathaniel-Z96okuOmPos-unsplash.jpg",
    // Nuvem
    "Rain":
        "https://cdn.pixabay.com/photo/2017/08/18/13/04/glass-2654887__340.jpg",
    // Chuva
    "Thunderstorm":
        "https://images.immediate.co.uk/production/volatile/sites/4/2020/08/GettyImages-NA006117-b5eac24.jpg",
    // Trovoada
    "Snow":
        "https://images.unsplash.com/photo-1418985991508-e47386d96a71?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c25vd3xlbnwwfHwwfHw%3D&w=1000&q=80",
    // Neve
    "50d":
        "https://i.pinimg.com/originals/84/41/3b/84413b084032a95c7705b5eaeb4ce3b7.jpg",
    // Nevoa
    "50n":
        "https://i.pinimg.com/originals/84/41/3b/84413b084032a95c7705b5eaeb4ce3b7.jpg",
    // Nevoa
  };

  String getImage(String iconName, String weatherState) {
    String imageNameReturned = "";

    images.forEach((key, value) {
      if (key == iconName || key == weatherState) {
        imageNameReturned = value;
      }
    });

    return imageNameReturned;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: FutureBuilder(
        future: getWeatherData(),
        builder: (context, snapshot) {
          CurrentWeather? weatherData = snapshot.data;

          if (snapshot.connectionState == ConnectionState.done &&
              weatherData != null) {
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
                  child: Lottie.network(
                    getIcon(
                      weatherData.iconName.toString(),
                      weatherData.main.toString(),
                    ),
                  ),
                ),
                Text(
                  "${weatherData.temperature}°C",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              ShowDialog.show(context, snapshot.error.toString());
            });

            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset("assets/images/map.png"),
            );
          }
        },
      ),
    );
  }
}
