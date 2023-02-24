class CurrentWeather {
  String? localName;
  String? iconName;
  String? main;
  String? description;
  double? temperature;

  CurrentWeather({
    this.localName,
    this.iconName,
    this.main,
    this.description,
    this.temperature,
  });

  CurrentWeather.fromJson(Map<String, dynamic> weatherData) {
    localName = weatherData["name"];
    iconName = weatherData["weather"][0]["icon"];
    main = weatherData["weather"][0]["main"];
    description = weatherData["weather"][0]["description"];
    temperature = weatherData["main"]["temp"];
  }
}
