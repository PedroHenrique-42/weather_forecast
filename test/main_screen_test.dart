import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/weather_model.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/screens/main_screen.dart';
import 'package:weather_forecast/services/current_weather_api_service.mocks.dart';
import 'package:weather_forecast/services/weather_forecast_api_service.mocks.dart';

void main() {
  Map<String, dynamic> fakeCurrentData = {
    "coord": {"lon": -55, "lat": -10},
    "weather": [
      {"id": 804, "main": "Clouds", "description": "nublado", "icon": "04d"}
    ],
    "base": "stations",
    "main": {
      "temp": 29.21,
      "feels_like": 32.62,
      "temp_min": 29.21,
      "temp_max": 29.21,
      "pressure": 1010,
      "humidity": 67,
      "sea_level": 1010,
      "grnd_level": 981
    },
    "visibility": 10000,
    "wind": {"speed": 1.48, "deg": 4, "gust": 2.4},
    "clouds": {"all": 100},
    "dt": 1677694412,
    "sys": {"country": "BR", "sunrise": 1677663825, "sunset": 1677708084},
    "timezone": -14400,
    "id": 3469034,
    "name": "Brazil",
    "cod": 200
  };
  Map<String, dynamic> fakeForecastData = {
    "dt": 1677704400,
    "main": {
      "temp": 28.88,
      "feels_like": 32.83,
      "temp_min": 28.23,
      "temp_max": 28.88,
      "pressure": 1010,
      "sea_level": 1010,
      "grnd_level": 980,
      "humidity": 72,
      "temp_kf": 0.65
    },
    "weather": [
      {"id": 500, "main": "Rain", "description": "chuva leve", "icon": "10d"}
    ],
    "clouds": {"all": 97},
    "wind": {"speed": 1.26, "deg": 203, "gust": 2.53},
    "visibility": 10000,
    "pop": 0.56,
    "rain": {"3h": 0.13},
    "sys": {"pod": "d"},
    "dt_txt": "2023-03-01 21:00:00"
  };

  final MockCurrentWeatherApiService currentWeatherMock =
      MockCurrentWeatherApiService();

  final MockWeatherForecastApiService weatherForecastMock =
      MockWeatherForecastApiService();

  testWidgets("My screen has a CircularProgressIndicator", (tester) async {
    when(currentWeatherMock.getCurrentWeather("Brasil")).thenAnswer(
      (_) => Future.delayed(
        const Duration(seconds: 1),
        () => WeatherModel.fromJson(fakeCurrentData),
      ),
    );

    when(weatherForecastMock.getWeatherForecast("Brasil")).thenAnswer(
      (_) => Future.value([WeatherModel.fromJsonForecast(fakeForecastData)]),
    );

    await tester.pumpWidget(
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
    await tester.pump(const Duration(seconds: 1));
  });
}
