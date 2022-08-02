import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource(this.dio);

  static const apiKey = 'apikey';
  static const baseUrl = 'http://api.openweathermap.org/data/2.5';
  static const units = 'metric';
  static const cityCodeMap = {
    'Silverstone, UK': 2637827,
    'São Paulo, Brazil': 3448439,
    'Melbourne, Australia': 2158177,
    'Monte Carlo, Monaco': 2992741
  };
}
