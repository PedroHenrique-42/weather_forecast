class CurrentWeather {
  String? weatherState;
  String? description;
  double? temperature;
  double? tempMin;
  double? tempMax;
  int? humidity;
  String? iconId;
  String? localName;

  CurrentWeather({
    this.weatherState,
    this.description,
    this.temperature,
    this.tempMin,
    this.tempMax,
    this.humidity,
    this.iconId,
    this.localName,
  });

  CurrentWeather.fromJson(Map<String, dynamic> weatherData) {
    weatherState = weatherData["weather"][0]["main"];
    description = weatherData["weather"][0]["description"];
    temperature = weatherData["main"]["temp"];
    tempMin = weatherData["main"]["temp_min"];
    tempMax = weatherData["main"]["temp_max"];
    humidity = weatherData["main"]["humidity"];
    iconId = weatherData["weather"][0]["icon"];
    localName = weatherData["name"];
  }
}
