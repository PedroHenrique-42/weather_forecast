import 'package:flutter/material.dart';
import 'package:weather_forecast/components/custom_card.dart';
import 'package:weather_forecast/components/search_bar/suffix_icon.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();

    return CustomCard(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          onTap: () => textFieldController.text = "",
          controller: textFieldController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(18),
            hintText: "Pesquise um local",
            filled: true,
            fillColor: const Color.fromRGBO(233, 233, 233, 1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: SuffixIcon(locationName: textFieldController),
          ),
        ),
      );
  }
}
