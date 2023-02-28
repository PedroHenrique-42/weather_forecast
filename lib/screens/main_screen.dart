import 'package:flutter/material.dart';
import 'package:weather_forecast/components/current_weather_informations/weather_informations_widget.dart';
import 'package:weather_forecast/components/search_bar/search_bar_widget.dart';
import 'package:weather_forecast/components/weather_forecast_informations/weather_forecast_widget.dart';
import 'package:weather_forecast/models/weather_model.dart';

class MainScreen extends StatefulWidget {
  final Future<WeatherModel?> currentWeatherFuture;
  final Future<List<WeatherModel>?> weatherForecastFuture;

  const MainScreen({
    Key? key,
    required this.currentWeatherFuture,
    required this.weatherForecastFuture,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (p0, viewportConstraints) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SearchBarWidget(),
                  WeatherInformationsWidget(
                      future: widget.currentWeatherFuture),
                  WeatherForecastWidget(future: widget.weatherForecastFuture),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
