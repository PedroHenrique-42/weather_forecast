import 'package:flutter/material.dart';
import 'package:weather_forecast/components/custom_card_widget.dart';
import 'package:weather_forecast/components/search_bar/suffix_icon_widget.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();

    return CustomCardWidget(
      child: TextField(
        onTap: () => textFieldController.text = "",
        controller: textFieldController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          hintText: "Pesquise um local",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: SuffixIconWidget(locationName: textFieldController),
        ),
      ),
    );
  }
}
