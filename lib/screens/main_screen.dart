import 'package:flutter/material.dart';
import 'package:weather_forecast/components/current_weather_informations/weather_informations_widget.dart';
import 'package:weather_forecast/components/search_bar/search_bar_widget.dart';
import 'package:weather_forecast/components/weather_forecast_informations/weather_forecast_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

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
                  if (MediaQuery.of(context).orientation ==
                      Orientation.landscape)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  const SearchBarWidget(),
                  if (MediaQuery.of(context).orientation ==
                      Orientation.landscape)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  const WeatherInformationsWidget(),
                  if (MediaQuery.of(context).orientation ==
                      Orientation.landscape)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  const WeatherForecastWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomSheet: Container(
      //   alignment: Alignment.center,
      //   height: 25,
      //   width: double.infinity,
      //   color: const Color.fromRGBO(103, 103, 103, 1),
      //   child: const Text(
      //     "Desenvolvido por: Pedro Ferezin \u00a9",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 12,
      //       fontStyle: FontStyle.italic,
      //     ),
      //   ),
      // ),
    );
  }
}
