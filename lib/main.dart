import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data_sources/local_data_source/models/weathers_list.dart';
import 'models/weather.dart';

void main() async {
  await setupHive();
  runApp(const MyApp());
}

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(WeatherAdapter())
    ..registerAdapter(WeathersListAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
