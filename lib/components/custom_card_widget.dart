import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const CustomCardWidget({
    Key? key,
    this.height,
    this.width,
    this.margin,
    this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(233, 233, 233, 1),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            blurRadius: 10,
            offset: Offset(3, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
