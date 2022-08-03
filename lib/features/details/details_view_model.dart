import 'package:mobx/mobx.dart';

import '../../main.dart';
import '../../repositories/weather_repository.dart';
import 'models/details_item.dart';

part 'details_view_model.g.dart';

class DetailsViewModel = _DetailsViewModel with _$DetailsViewModel;

abstract class _DetailsViewModel with Store {
  final int cityCode;

  _DetailsViewModel(this.cityCode) {
    getForecast();
  }

  @observable
  bool isLoading = false;

  @observable
  List<DetailsItem> items = [];

  @action
  Future<void> getForecast() async {
    isLoading = true;
    try {
      final response =
          await getIt<WeatherRepository>().getCityForecast(cityCode);
      final detailsItems = <DetailsItem>[];
      if (response != null) {
        for (final dailyForecast in response.dailyForecasts) {
          detailsItems.add(DetailsDate(dailyForecast.date));
          for (final hourForecast in dailyForecast.forecasts) {
            detailsItems.add(DetailsForecast(hourForecast));
          }
        }
      }
      items = detailsItems;
    } catch (e) {
      items = [];
    } finally {
      isLoading = false;
    }
  }
}
