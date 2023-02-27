import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/weather_model.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/services/weather_forecast_api_service.dart';
import 'package:weather_forecast/utils/get_icon_asset.dart';
import 'package:weather_forecast/utils/get_week_day.dart';

import '../custom_card_widget.dart';

class WeatherForecastWidget extends StatelessWidget {
  const WeatherForecastWidget({Key? key}) : super(key: key);

  Future<List<WeatherModel>?> getWeatherForecast(BuildContext context) async {
    List<WeatherModel>? weatherForecast;

    weatherForecast = await WeatherForecastApiService().getWeatherForecast(
      Provider.of<WeatherDataProvider>(context).locationName ?? "Brasil",
    );

    return weatherForecast;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeatherForecast(context),
      builder: (context, weatherDataResult) {
        List<WeatherModel>? weatherData = weatherDataResult.data;

        if (weatherDataResult.connectionState == ConnectionState.done &&
            weatherData != null) {
          return CustomCardWidget(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: weatherData.map((forecastDataElement) {
                  return Column(
                    children: [
                      Text(
                        GetWeekDay.get(forecastDataElement.dateTime!.weekday),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Lottie.asset(
                          GetIconAsset.getIcon(
                            forecastDataElement.iconId.toString(),
                            forecastDataElement.weatherState.toString(),
                          ),
                        ),
                      ),
                      Text("${forecastDataElement.temperature!.toInt()}°C")
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
