import '../../../models/hourly_forecast.dart';

class DetailsItem {}

class DetailsForecast extends DetailsItem {
  final HourlyForecast forecast;

  DetailsForecast(this.forecast);
}

class DetailsDate extends DetailsItem {
  final String date;

  DetailsDate(this.date);
}
