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
import 'package:weather_forecast/services/weather_forecast_api_service.dart';
import 'package:weather_forecast/utils/show_dialog.dart';

class WeatherForecastInformations extends StatefulWidget {
  const WeatherForecastInformations({Key? key}) : super(key: key);

  @override
  State<WeatherForecastInformations> createState() => _WeatherForecastInformationsState();
}

class _WeatherForecastInformationsState extends State<WeatherForecastInformations> {
  Future<List<CurrentWeather>?> getWeatherForecast() async {
    List<CurrentWeather>? weatherForecast;

    weatherForecast = await WeatherForecastApiService().getWeatherForecast(
      Provider.of<WeatherDataProvider>(context).locationName ?? "Brasil",
    );

    return weatherForecast;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeatherForecast(),
      builder: (context, weatherDataResult) {
        List<CurrentWeather>? weatherData = weatherDataResult.data;

        if (weatherDataResult.connectionState == ConnectionState.done &&
            weatherData != null) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(weatherData[0].temperature.toString()),
              Text(weatherData[1].temperature.toString()),
              Text(weatherData[2].temperature.toString()),
              Text(weatherData[3].temperature.toString()),
              Text(weatherData[4].temperature.toString()),
            ]
          );
        } else if (weatherDataResult.connectionState ==
            ConnectionState.waiting) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          SchedulerBinding.instance.addPostFrameCallback(
            (_) {
              ShowDialog.show(context, weatherDataResult.error.toString());
            },
          );

          return const Text("Local não encontrado");
        }
      },
    );
  }
}
