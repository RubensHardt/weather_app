import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/features/home/home_page.dart';
import 'package:weather_app/repositories/weather_repository.dart';

import 'data_sources/local_data_source/local_data_source.dart';
import 'data_sources/local_data_source/models/weathers_list.dart';
import 'data_sources/remote_data_source/remote_data_source.dart';
import 'models/weather.dart';

final getIt = GetIt.instance;

void main() async {
  await setupHive();
  setupWeatherRepository();
  runApp(const MyApp());
}

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(WeatherAdapter())
    ..registerAdapter(WeathersListAdapter());
}

void setupWeatherRepository() {
  getIt.registerSingleton(WeatherRepository(
    remoteDataSource: RemoteDataSource(Dio()),
    localDataSource: LocalDataSource(Hive),
  ));
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
      home: HomePage(),
    );
  }
}
