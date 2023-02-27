import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LocalNotFoundWidget extends StatelessWidget {
  const LocalNotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Lottie.asset("assets/animations/not_found_animation.json"),
    );
  }
}
