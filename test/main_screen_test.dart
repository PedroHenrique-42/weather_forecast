import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/components/current_weather_informations/weather_informations_widget.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/screens/main_screen.dart';
import 'package:weather_forecast/utils/show_dialog.dart';

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

  testWidgets("Finds a search bar", (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (changeNotifierContext) {
          return WeatherDataProvider();
        },
        child: const MaterialApp(
          home: MainScreen(),
        ),
      ),
    );

    expect(find.byType(WeatherInformationsWidget), findsOneWidget);

    await tester.pumpWidget(const WeatherInformationsWidget());

    expect(find.byType(FutureBuilder), findsOneWidget);
  });
}
