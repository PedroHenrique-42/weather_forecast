import 'package:flutter/material.dart';

class WeatherDataProvider extends ChangeNotifier {
  String? _locationName;
  String? _imageName;

  String? get locationName => _locationName;

  void setLocationName(String locationName) {
    _locationName = locationName;
    notifyListeners();
  }

  String? get imageName {
    return _imageName;
  }

  void setImageName(String imageName) {
    _imageName = imageName;
    notifyListeners();
  }
}
