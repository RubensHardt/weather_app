import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final double temperature;
  final TextStyle? style;

  const Temperature(this.temperature, {this.style, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$temperature ºC', style: style);
  }
}
