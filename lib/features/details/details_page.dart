import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'details_view_model.dart';
import 'models/details_item.dart';
import 'widgets/date_item.dart';
import 'widgets/forecast_item.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage(this.cityCode, this.city, {Key? key}) : super(key: key) {
    viewModel = DetailsViewModel(cityCode);
  }

  final int cityCode;
  final String city;
  late final DetailsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city),
      ),
      body: Observer(
        builder: (_) => viewModel.isLoading ? loading() : content(),
      ),
    );
  }

  Widget loading() => const Center(child: CircularProgressIndicator());

  Widget content() {
    return ListView.separated(
      itemCount: viewModel.items.length,
      itemBuilder: (context, index) {
        final item = viewModel.items[index];
        if (item is DetailsDate) {
          return DateItem(item.date);
        } else if (item is DetailsForecast) {
          return ForecastItem(item.forecast);
        } else {
          return const SizedBox.shrink();
        }
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
