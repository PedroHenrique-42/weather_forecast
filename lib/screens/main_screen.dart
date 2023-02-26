import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/components/search_bar/search_bar.dart';
import 'package:weather_forecast/components/weather_forecast_informations/weather_forecast.dart';
import 'package:weather_forecast/components/weather_informations/weather_informations.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool valor = false;

  void boolean(bool value) {
    setState(() {
      valor = !valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(103, 103, 103, 1),
        title: Switch(value: valor, onChanged: boolean),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
                minWidth: viewportConstraints.maxWidth,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SearchBar(),
                  WeatherInformations(),
                  WeatherForecastInformations(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

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
