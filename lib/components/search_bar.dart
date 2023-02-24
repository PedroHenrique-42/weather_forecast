import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/models/current_weather.dart';
import 'package:weather_forecast/providers/weather_data_provider.dart';
import 'package:weather_forecast/utils/show_dialog.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onTap: () => textFieldController.text = "",
        controller: textFieldController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          hintText: "Pesquise um local",
          filled: true,
          fillColor: const Color.fromRGBO(255, 255, 255, 0.8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              Provider.of<WeatherDataProvider>(
                context,
                listen: false,
              ).setLocationName(textFieldController.text);
              FocusScope.of(context).unfocus();
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
