import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/components/local_not_found.dart';
import 'package:weather_forecast/components/weather_informations/additional_informations_card.dart';
import 'package:weather_forecast/components/weather_informations/basic_informations_card.dart';
import 'package:weather_forecast/models/current_weather.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/services/current_weather_api_service.dart';
import 'package:weather_forecast/utils/show_dialog.dart';

class WeatherInformations extends StatefulWidget {
  const WeatherInformations({Key? key}) : super(key: key);

  @override
  State<WeatherInformations> createState() => _WeatherInformationsState();
}

class _WeatherInformationsState extends State<WeatherInformations> {
  Future<CurrentWeather?> getWeatherData() async {
    CurrentWeather? weatherData;

    weatherData = await CurrentWeatherApiService().getCurrentWeather(
      Provider.of<WeatherDataProvider>(context).locationName ?? "Brasil",
    );

    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeatherData(),
      builder: (context, weatherDataResult) {
        CurrentWeather? weatherData = weatherDataResult.data;

        if (weatherDataResult.connectionState == ConnectionState.done &&
            weatherData != null) {
          return Column(
            children: [
              BasicInformationsCard(weatherData),
              const SizedBox(height: 30),
              AdditionalInformationsCard(weatherData),
            ],
          );
        } else if (weatherDataResult.connectionState ==
            ConnectionState.waiting) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (weatherDataResult.connectionState == ConnectionState.none) {
          return Text("None");
        } else {
          SchedulerBinding.instance.addPostFrameCallback(
            (_) {
              ShowDialog.show(context, weatherDataResult.error.toString());
            },
          );

          return const LocalNotFound();
        }
      },
    );
  }
}
