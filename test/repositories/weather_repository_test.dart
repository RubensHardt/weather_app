import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/data_sources/local_data_source/local_data_source.dart';
import 'package:weather_app/data_sources/remote_data_source/remote_data_source.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSource {}

class MockLocalDataSource extends Mock implements LocalDataSource {}

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late WeatherRepository weatherRepository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    weatherRepository = WeatherRepository(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  test(
    "getCurrentWeathers() should return a remote instance of a list of weathers on remoteDataSource's getCurrentWeathers() success",
    () async {
      // Given
      final mockedResponse = <Weather>[];
      when(mockRemoteDataSource.getCurrentWeathers)
          .thenAnswer((_) async => Future.value(mockedResponse));
      when(() => mockLocalDataSource.saveCurrentWeathers(any()))
          .thenAnswer((_) async {});

      // When
      final response = await weatherRepository.getCurrentWeathers();

      //Then
      expect(response, mockedResponse);
    },
  );

  test(
    "getCurrentWeathers() should return a local instance of a list of weathers on remoteDataSource's getCurrentWeathers() failure",
    () async {
      // Given
      final mockedLocalInstance = <Weather>[];
      when(mockRemoteDataSource.getCurrentWeathers)
          .thenAnswer((_) async => throw Exception("Mock exception"));
      when(() => mockLocalDataSource.getCurrentWeathers())
          .thenAnswer((_) async => mockedLocalInstance);

      // When
      final response = await weatherRepository.getCurrentWeathers();

      //Then
      expect(response, mockedLocalInstance);
    },
  );
}
