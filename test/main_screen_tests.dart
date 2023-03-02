import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/components/current_weather_informations/additional_informations_widget.dart';
import 'package:weather_forecast/components/current_weather_informations/weather_informations_widget.dart';
import 'package:weather_forecast/data/weather_data.dart';
import 'package:weather_forecast/models/weather_model.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/screens/main_screen.dart';
import 'package:weather_forecast/services/current_weather_api_service.mocks.dart';
import 'package:weather_forecast/services/weather_forecast_api_service.mocks.dart';

void main() {
  final MockCurrentWeatherApiService currentWeatherMock =
      MockCurrentWeatherApiService();

  final MockWeatherForecastApiService weatherForecastMock =
      MockWeatherForecastApiService();

  group("Current weather informations tests ", () {
    testWidgets(
      "Screen has a CircularProgressIndicator while wait for API data",
      (widgetTester) async {
        when(currentWeatherMock.getCurrentWeather("Brasil")).thenAnswer((_) {
          return Future.delayed(
            const Duration(seconds: 1),
            () => WeatherModel.fromJson(WeatherData.fakeCurrentData),
          );
        });
        when(weatherForecastMock.getWeatherForecast("Brasil")).thenAnswer((_) {
          return Future.value([
            WeatherModel.fromJsonForecast(WeatherData.fakeForecastData),
          ]);
        });

        await widgetTester.pumpWidget(
          ChangeNotifierProvider(
            create: (context) => WeatherDataProvider(),
            child: MaterialApp(
              home: MainScreen(
                currentWeatherFuture: currentWeatherMock.getCurrentWeather(
                  "Brasil",
                ),
                weatherForecastFuture: weatherForecastMock.getWeatherForecast(
                  "Brasil",
                ),
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        await widgetTester.pump(const Duration(seconds: 1));
        expect(find.byType(CircularProgressIndicator), findsNothing);
      },
    );

    testWidgets(
      "Screen has a WeatherInformationsWidget when future has data",
      (widgetTester) async {
        when(currentWeatherMock.getCurrentWeather("Brasil")).thenAnswer((_) {
          return Future.value(
              WeatherModel.fromJson(WeatherData.fakeCurrentData));
        });
        when(weatherForecastMock.getWeatherForecast("Brasil")).thenAnswer((_) {
          return Future.value([
            WeatherModel.fromJsonForecast(WeatherData.fakeForecastData),
          ]);
        });

        await widgetTester.pumpWidget(
          ChangeNotifierProvider(
            create: (context) => WeatherDataProvider(),
            child: MaterialApp(
              home: MainScreen(
                currentWeatherFuture: currentWeatherMock.getCurrentWeather(
                  "Brasil",
                ),
                weatherForecastFuture: weatherForecastMock.getWeatherForecast(
                  "Brasil",
                ),
              ),
            ),
          ),
        );

        await widgetTester.pump();

        expect(
          find.ancestor(
            of: find.byType(PageView),
            matching: find.byType(WeatherInformationsWidget),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      "Screen has a AdditionalInformationsWidget when future has data and PageView is scrolled",
      (widgetTester) async {
        when(currentWeatherMock.getCurrentWeather("Brasil")).thenAnswer((_) {
          return Future.value(
              WeatherModel.fromJson(WeatherData.fakeCurrentData));
        });
        when(weatherForecastMock.getWeatherForecast("Brasil")).thenAnswer((_) {
          return Future.value([
            WeatherModel.fromJsonForecast(WeatherData.fakeForecastData),
          ]);
        });

        await widgetTester.pumpWidget(
          ChangeNotifierProvider(
            create: (context) => WeatherDataProvider(),
            child: MaterialApp(
              home: MainScreen(
                currentWeatherFuture: currentWeatherMock.getCurrentWeather(
                  "Brasil",
                ),
                weatherForecastFuture: weatherForecastMock.getWeatherForecast(
                  "Brasil",
                ),
              ),
            ),
          ),
        );
        await widgetTester.pump();
        await widgetTester.drag(find.byType(PageView), const Offset(-500, 0));
        await widgetTester.pump();

        expect(
          find.byType(
            AdditionalInformationsWidget,
          ),
          findsOneWidget,
        );
      },
    );
  });

  group("Weather forecast informations tests ", () {
    testWidgets(
      "Screen has a empty SizedBox while wait for API data",
      (widgetTester) async {
        when(currentWeatherMock.getCurrentWeather("Brasil")).thenAnswer((_) {
          return Future.delayed(
            const Duration(seconds: 1),
            () => WeatherModel.fromJson(WeatherData.fakeCurrentData),
          );
        });

        when(weatherForecastMock.getWeatherForecast("Brasil")).thenAnswer((_) {
          return Future.value([
            WeatherModel.fromJsonForecast(WeatherData.fakeForecastData),
          ]);
        });

        await widgetTester.pumpWidget(
          ChangeNotifierProvider(
            create: (context) => WeatherDataProvider(),
            child: MaterialApp(
              home: MainScreen(
                currentWeatherFuture: currentWeatherMock.getCurrentWeather(
                  "Brasil",
                ),
                weatherForecastFuture: weatherForecastMock.getWeatherForecast(
                  "Brasil",
                ),
              ),
            ),
          ),
        );

        expect(
            find.byKey(const Key("WeatherForecastSizedBox")), findsOneWidget);
        await widgetTester.pump(const Duration(seconds: 1));
        expect(find.byKey(const Key("WeatherForecastSizedBox")), findsNothing);
      },
    );

    testWidgets(
      "Screen has a WeatherForecastCardWidget when future has data",
          (widgetTester) async {
        when(currentWeatherMock.getCurrentWeather("Brasil")).thenAnswer((_) {
          return Future.value(
              WeatherModel.fromJson(WeatherData.fakeCurrentData));
        });
        when(weatherForecastMock.getWeatherForecast("Brasil")).thenAnswer((_) {
          return Future.value([
            WeatherModel.fromJsonForecast(WeatherData.fakeForecastData),
          ]);
        });

        await widgetTester.pumpWidget(
          ChangeNotifierProvider(
            create: (context) => WeatherDataProvider(),
            child: MaterialApp(
              home: MainScreen(
                currentWeatherFuture: currentWeatherMock.getCurrentWeather(
                  "Brasil",
                ),
                weatherForecastFuture: weatherForecastMock.getWeatherForecast(
                  "Brasil",
                ),
              ),
            ),
          ),
        );

        await widgetTester.pump();

        expect(
          find.byKey(const Key("WeatherForecastCard")),
          findsOneWidget,
        );
      },
    );
  });
}
