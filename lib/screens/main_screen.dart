import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/components/search_bar.dart';
import 'package:weather_forecast/components/weather_informations.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.96,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SearchBar(),
                WeatherInformations(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
