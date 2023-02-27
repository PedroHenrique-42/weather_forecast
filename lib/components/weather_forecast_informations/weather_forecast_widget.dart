import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/weather_model.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/services/weather_forecast_api_service.dart';
import 'package:weather_forecast/utils/show_dialog.dart';

import '../custom_card_widget.dart';

class WeatherForecastWidget extends StatefulWidget {
  const WeatherForecastWidget({Key? key}) : super(key: key);

  @override
  State<WeatherForecastWidget> createState() => _WeatherForecastWidgetState();
}

class _WeatherForecastWidgetState extends State<WeatherForecastWidget> {
  Future<List<WeatherModel>?> getWeatherForecast() async {
    List<WeatherModel>? weatherForecast;

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
        List<WeatherModel>? weatherData = weatherDataResult.data;

        if (weatherDataResult.connectionState == ConnectionState.done &&
            weatherData != null) {
          return CustomCardWidget(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${weatherData[0].dateTime?.weekday == 2 ? "S" : ""}\n"
                      "${weatherData[0].temperature.toString()}",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${weatherData[1].dateTime?.weekday == 3 ? "T" : ""}\n"
                      "${weatherData[1].temperature.toString()}",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${weatherData[2].dateTime?.weekday == 4 ? "Q" : ""}\n"
                      "${weatherData[2].temperature.toString()}",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${weatherData[3].dateTime?.weekday == 5 ? "Q" : ""}\n"
                      "${weatherData[3].temperature.toString()}",
                      textAlign: TextAlign.center,
                    ),
                  ]),
            ),
          );
        } else if (weatherDataResult.connectionState ==
            ConnectionState.waiting) {
          return const SizedBox();
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
