import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_forecast/components/current_weather_informations/additional_informations_widget.dart';
import 'package:weather_forecast/components/current_weather_informations/basic_informations_widget.dart';
import 'package:weather_forecast/components/custom_card_widget.dart';
import 'package:weather_forecast/components/local_not_found_widget.dart';
import 'package:weather_forecast/exceptions/local_not_found_exception.dart';
import 'package:weather_forecast/models/weather_model.dart';
import 'package:weather_forecast/utils/show_dialog.dart';

class WeatherInformationsWidget extends StatelessWidget {
  final Future<WeatherModel?> future;

  const WeatherInformationsWidget({Key? key, required this.future}) : super(key: key);

  Future<WeatherModel?> getWeatherData(BuildContext context) async {
    WeatherModel? weatherData;

    try {
      weatherData = await future;

      return weatherData;
    } on IOException {
      await ShowDialog.show(
        context,
        "Por favor, verifique sua conexão com a internet.",
      );
    } on LocalNotFoundException catch (error) {
      await ShowDialog.show(
        context,
        error.toString(),
      );
    } catch (unknowError) {
      await ShowDialog.show(
        context,
        "Por favor, aguarde enquanto nossa equipe resolve o problema.",
      );
    }

    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageViewController = PageController();

    return FutureBuilder(
      future: getWeatherData(context),
      builder: (context, weatherDataResult) {
        WeatherModel? weatherData = weatherDataResult.data;

        if (weatherDataResult.connectionState == ConnectionState.done &&
            weatherData != null) {
          return Column(
            children: [
              CustomCardWidget(
                height:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? MediaQuery.of(context).size.height * 0.6
                        : MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.6,
                // child: ListView(),
                child: PageView(
                  controller: pageViewController,
                  children: [
                    BasicInformationsWidget(weatherData),
                    AdditionalInformationsWidget(weatherData),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SmoothPageIndicator(
                  controller: pageViewController,
                  count: 2,
                  effect: const JumpingDotEffect(
                    activeDotColor: Colors.lightBlueAccent,
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                ),
              ),
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
        } else {
          return const LocalNotFoundWidget();
        }
      },
    );
  }
}
