import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;

  const CustomCardWidget({
    Key? key,
    this.height,
    this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      color: Theme.of(context).cardColor,
      child: SizedBox(
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
