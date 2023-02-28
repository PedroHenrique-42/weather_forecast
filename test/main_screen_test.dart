import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/screens/main_screen.dart';

void main() {
  testWidgets("My screen has a text 'Pesquise um local'", (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => WeatherDataProvider(),
        child: const MaterialApp(
          home: MainScreen(),
        ),
      ),
    );

    final pesquiseFinder = find.text("Pesquise um local");
    expect(pesquiseFinder, findsOneWidget);
  });
}
