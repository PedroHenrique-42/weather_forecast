import 'package:flutter/material.dart';
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
  CurrentWeather? weatherData;

  Future<void> getWeatherData() async {
    weatherData = await WeatherApiService().getCurrentWeather(
      Provider.of<WeatherDataProvider>(context).locationName ?? "Brasil",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: FutureBuilder(
        future: getWeatherData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              weatherData != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${weatherData!.localName}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Image.network(
                  "http://openweathermap.org/img/wn/${weatherData!.iconName}@2x.png",
                ),
                Text(
                  "${weatherData!.temperature!.toStringAsFixed(1)}°C",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return ShowDialog.show(context, "Opa");
          } else {
            return const Text("Nenhum local encontrado!");
          }
        },
      ),
    );
  }
}
