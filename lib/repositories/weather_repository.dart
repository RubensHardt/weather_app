import '../data_sources/local_data_source/local_data_source.dart';
import '../data_sources/remote_data_source/remote_data_source.dart';
import '../models/weather.dart';

class WeatherRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  WeatherRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<List<Weather>?> getCurrentWeathers() async {
    return await remoteDataSource.getCurrentWeathers();
  }
}
