import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/data_sources/remote_data_source/remote_data_source.dart';
import 'package:weather_app/models/daily_forecast.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/hourly_forecast.dart';
import 'package:weather_app/models/weather.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late RemoteDataSource remoteDataSource;

  setUp(() {
    mockDio = MockDio();
    remoteDataSource = RemoteDataSource(mockDio);
  });

  test(
      "getCurrentWeathers() should return a remote instance of a list of weathers on get() success",
      () async {
    // Given
    final mockedResponse = {
      "cnt": 1,
      "list": [
        {
          "coord": {"lon": -1.026, "lat": 52.0922},
          "sys": {
            "country": "GB",
            "timezone": 3600,
            "sunrise": 1659241422,
            "sunset": 1659297428
          },
          "weather": [
            {
              "id": 500,
              "main": "Rain",
              "description": "light rain",
              "icon": "10n"
            }
          ],
          "main": {
            "temp": 17.73,
            "feels_like": 17.28,
            "temp_min": 16.86,
            "temp_max": 18.66,
            "pressure": 1017,
            "sea_level": 1017,
            "grnd_level": 1002,
            "humidity": 66
          },
          "visibility": 10000,
          "wind": {"speed": 4.99, "deg": 241},
          "clouds": {"all": 100},
          "dt": 1659222358,
          "id": 2637827,
          "name": "Silverstone"
        },
      ]
    };
    final expectedResponse = [
      Weather(
        cityCode: 2637827,
        city: "Silverstone",
        countryCode: "GB",
        temperature: 17.73,
        state: "Rain",
        iconCode: "10n",
        description: "light rain",
      )
    ];
    when(() => mockDio.get(
            '$baseUrl/group?id=${cityCodeMap.values.join(',')}&units=$units&appid=$apiKey'))
        .thenAnswer(
      (_) async => Response(
          data: mockedResponse, requestOptions: RequestOptions(path: '')),
    );

    // When
    final response = await remoteDataSource.getCurrentWeathers();

    //Then
    expect(response, expectedResponse);
  });

  test(
      "getCityForecast(int cityCode) should return a remote instance of a city forecast on get() success",
      () async {
    // Given
    final mockedResponse = {
      "cod": "200",
      "message": 0,
      "cnt": 1,
      "list": [
        {
          "dt": 1659290400,
          "main": {
            "temp": 24.21,
            "feels_like": 23.91,
            "temp_min": 22.45,
            "temp_max": 24.21,
            "pressure": 1016,
            "sea_level": 1016,
            "grnd_level": 1001,
            "humidity": 47,
            "temp_kf": 1.76
          },
          "weather": [
            {
              "id": 803,
              "main": "Clouds",
              "description": "broken clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 70},
          "wind": {"speed": 4.08, "deg": 325, "gust": 4.39},
          "visibility": 10000,
          "pop": 0.6,
          "sys": {"pod": "d"},
          "dt_txt": "2022-07-31 18:00:00"
        },
      ],
      "city": {
        "id": 2637827,
        "name": "Silverstone",
        "coord": {"lat": 52.0922, "lon": -1.026},
        "country": "GB",
        "population": 0,
        "timezone": 3600,
        "sunrise": 1659241422,
        "sunset": 1659297428
      }
    };
    final expectedResponse = Forecast(
      cityCode: 2637827,
      city: "Silverstone",
      country: "GB",
      dailyForecasts: [
        DailyForecast(
          date: '2022-07-31',
          forecasts: [
            HourlyForecast(
              temperature: 24.21,
              state: "Clouds",
              iconCode: "04d",
              time: '18:00:00',
            )
          ],
        )
      ],
    );
    const cityCode = 2637827;
    when(() => mockDio
            .get('$baseUrl/forecast?id=$cityCode&units=$units&appid=$apiKey'))
        .thenAnswer(
      (_) async => Response(
          data: mockedResponse, requestOptions: RequestOptions(path: '')),
    );

    // When
    final response = await remoteDataSource.getCityForecast(cityCode);

    //Then
    expect(response, expectedResponse);
  });
}
