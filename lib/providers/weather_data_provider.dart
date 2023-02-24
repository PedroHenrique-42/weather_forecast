import 'package:flutter/material.dart';

class WeatherDataProvider extends ChangeNotifier {
  String? _locationName;

  String? get locationName => _locationName;

  void setLocationName(String locationName) {
    _locationName = locationName;
    notifyListeners();
  }
}