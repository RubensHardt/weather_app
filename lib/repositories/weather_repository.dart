import '../data_sources/remote_data_source/remote_data_source.dart';
import '../models/weather.dart';

class WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepository({
    required this.remoteDataSource,
  });

  Future<List<Weather>?> getCurrentWeathers() async {
    return await remoteDataSource.getCurrentWeathers();
  }
}
