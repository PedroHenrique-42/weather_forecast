import 'package:flutter/material.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/themes/main_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mainTheme,
        home: const MainScreen(),
      ),
    );
  }
}
