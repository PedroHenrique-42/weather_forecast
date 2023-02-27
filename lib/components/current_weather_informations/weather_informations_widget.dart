import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/components/local_not_found_widget.dart';
import 'package:weather_forecast/components/weather_informations/additional_informations_widget.dart';
import 'package:weather_forecast/components/weather_informations/basic_informations_widget.dart';
import 'package:weather_forecast/models/weather_model.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/services/current_weather_api_service.dart';
import 'package:weather_forecast/utils/show_dialog.dart';

class WeatherInformationsWidget extends StatefulWidget {
  const WeatherInformationsWidget({Key? key}) : super(key: key);

  @override
  State<WeatherInformationsWidget> createState() => _WeatherInformationsWidgetState();
}

class _WeatherInformationsWidgetState extends State<WeatherInformationsWidget> {
  Future<WeatherModel?> getWeatherData() async {
    WeatherModel? weatherData;

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
        WeatherModel? weatherData = weatherDataResult.data;

        if (weatherDataResult.connectionState == ConnectionState.done &&
            weatherData != null) {
          return Column(
            children: [
              BasicInformationsWidget(weatherData),
              const SizedBox(height: 30),
              AdditionalInformationsWidget(weatherData),
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
          return const Text("None");
        } else {
          SchedulerBinding.instance.addPostFrameCallback(
            (_) {
              ShowDialog.show(context, weatherDataResult.error.toString());
            },
          );

          return const LocalNotFoundWidget();
        }
      },
    );
  }
}
