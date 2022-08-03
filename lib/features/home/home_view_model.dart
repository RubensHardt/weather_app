import 'package:mobx/mobx.dart';

import '../../main.dart';
import '../../models/weather.dart';
import '../../repositories/weather_repository.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  _HomeViewModel() {
    _getCitiesWeather();
  }

  @observable
  bool isLoading = false;

  @observable
  List<Weather> weathers = [];

  @action
  Future<void> _getCitiesWeather() async {
    isLoading = true;
    try {
      final response = await getIt<WeatherRepository>().getCurrentWeathers();
      weathers = response ?? [];
    } catch (e) {
      weathers = [];
    } finally {
      isLoading = false;
    }
  }
}
