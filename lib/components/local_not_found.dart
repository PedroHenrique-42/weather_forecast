import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LocalNotFound extends StatelessWidget {
  const LocalNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Lottie.network(
        "https://assets10.lottiefiles.com/private_files/lf30_3X1oGR.json",
      ),
    );;
  }
}
