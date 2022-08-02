import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'home_view_model.dart';
import 'widgets/cities_weather_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Current Weather'),
          ),
          body: viewModel.isLoading ? loading() : content(),
        );
      },
    );
  }

  Widget loading() => const Center(child: CircularProgressIndicator());

  Widget content() => CitiesWeatherList(viewModel.weathers);
}
