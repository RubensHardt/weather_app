import 'package:dio/dio.dart';

import '../../models/weather.dart';

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource(this.dio);

  static const apiKey = 'apiKey';
  static const baseUrl = 'http://api.openweathermap.org/data/2.5';
  static const units = 'metric';
  static const cityCodeMap = {
    'Silverstone, UK': 2637827,
    'São Paulo, Brazil': 3448439,
    'Melbourne, Australia': 2158177,
    'Monte Carlo, Monaco': 2992741
  };

  Future<List<Weather>> getCurrentWeathers() async {
    try {
      final response = await dio.get(
          '$baseUrl/group?id=${cityCodeMap.values.join(',')}&units=$units&appid=$apiKey');
      final result = _parseWeathers(response.data);
      return result;
    } catch (error) {
      return Future.error(error);
    }
  }

  List<Weather> _parseWeathers(dynamic response) {
    final responseList = response['list'] as List<dynamic>;
    final parsed = responseList.map((element) {
      final weather = element['weather'][0];
      return Weather(
        cityCode: element['id'],
        city: element['name'],
        countryCode: element['sys']['country'],
        temperature: _parseTemperature(element),
        state: weather['main'],
        iconCode: weather['icon'],
        description: weather['description'],
      );
    }).toList();
    return parsed;
  }

  double _parseTemperature(dynamic value) {
    return double.tryParse(value['main']['temp'].toString()) ?? 0.0;
  }
}
