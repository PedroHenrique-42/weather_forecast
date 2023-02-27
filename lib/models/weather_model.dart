class WeatherModel {
  String? weatherState;
  String? description;
  double? temperature;
  double? tempMin;
  double? tempMax;
  int? humidity;
  String? iconId;
  String? localName;
  DateTime? dateTime;
  double? feelsLike;

  WeatherModel({
    this.weatherState,
    this.description,
    this.temperature,
    this.tempMin,
    this.tempMax,
    this.humidity,
    this.iconId,
    this.localName,
    this.dateTime,
    this.feelsLike,
  });

  WeatherModel.fromJson(Map<String, dynamic> weatherData) {
    weatherState = weatherData["weather"][0]["main"];
    description = weatherData["weather"][0]["description"];
    temperature = weatherData["main"]["temp"];
    tempMin = weatherData["main"]["temp_min"];
    tempMax = weatherData["main"]["temp_max"];
    humidity = weatherData["main"]["humidity"];
    iconId = weatherData["weather"][0]["icon"];
    localName = weatherData["name"];
    feelsLike = tempMax = weatherData["main"]["feels_like"];
  }

  WeatherModel.fromJsonForecast(Map<String, dynamic> weatherData) {
    weatherState = weatherData["weather"][0]["main"];
    temperature = weatherData["main"]["temp"];
    iconId = weatherData["weather"][0]["icon"];
    dateTime = DateTime.parse(weatherData["dt_txt"]);
  }

}
