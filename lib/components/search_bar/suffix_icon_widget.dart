import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/services/weather_forecast_api_service.dart';
import 'package:weather_forecast/utils/show_snack_bar.dart';

class SuffixIcon extends StatelessWidget {
  final TextEditingController locationName;

  const SuffixIcon({Key? key, required this.locationName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (locationName.text.isEmpty) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ShowSnackBar.show(context, "Preencha o campo acima");
          return;
        }

        Provider.of<WeatherDataProvider>(
          context,
          listen: false,
        ).setLocationName(locationName.text);
        FocusScope.of(context).unfocus();
      },
      icon: const Icon(Icons.search, color: Colors.black),
    );
  }
}
