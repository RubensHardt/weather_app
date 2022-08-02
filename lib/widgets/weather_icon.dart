import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String iconCode;
  final double? width;

  const WeatherIcon({required this.iconCode, this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'http://openweathermap.org/img/wn/$iconCode@2x.png',
      width: width,
    );
  }
}
