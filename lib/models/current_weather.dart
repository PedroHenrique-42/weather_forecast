class CurrentWeather {
  String? localName;
  String? iconName;
  String? description;
  double? temperature;

  CurrentWeather({
     this.localName,
     this.iconName,
     this.description,
     this.temperature,
  });

  CurrentWeather.fromJson(Map<String, dynamic> weatherData) {
    localName = weatherData["name"];
    iconName = weatherData["weather"][0]["icon"];
    description = weatherData["weather"][0]["description"];
    temperature = weatherData["main"]["temp"];
  }
}