import 'package:dio/dio.dart';

import '../../models/daily_forecast.dart';
import '../../models/forecast.dart';
import '../../models/hourly_forecast.dart';
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

  Future<Forecast> getCityForecast(int cityCode) async {
    try {
      final response = await dio
          .get('$baseUrl/forecast?id=$cityCode&units=$units&appid=$apiKey');
      final result = _parseForecast(response.data);
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

  Forecast _parseForecast(dynamic response) {
    final responseList = response['list'] as List<dynamic>;
    final dailyForecasts = _parseDailyForecast(responseList);
    final cityInfo = response['city'];
    return Forecast(
      cityCode: cityInfo['id'],
      city: cityInfo['name'],
      country: cityInfo['country'],
      dailyForecasts: dailyForecasts,
    );
  }

  List<DailyForecast> _parseDailyForecast(List<dynamic> responseList) {
    final uniqueDates = responseList.map((e) => _parseDate(e)).toSet();
    return uniqueDates.map((date) {
      return DailyForecast(
        date: date,
        forecasts: _parseHourlyForecast(date, responseList),
      );
    }).toList();
  }

  List<HourlyForecast> _parseHourlyForecast(
    String date,
    List<dynamic> responseList,
  ) {
    return responseList.where((e) => _parseDate(e) == date).map((e) {
      final weather = e['weather'][0];
      return HourlyForecast(
        temperature: _parseTemperature(e),
        state: weather['main'],
        iconCode: weather['icon'],
        time: _parseTime(e),
      );
    }).toList();
  }

  String _parseTime(dynamic value) =>
      value['dt_txt'].toString().split(' ').last;

  String _parseDate(dynamic value) =>
      value['dt_txt'].toString().split(' ').first;

  double _parseTemperature(dynamic value) {
    return double.tryParse(value['main']['temp'].toString()) ?? 0.0;
  }
}
