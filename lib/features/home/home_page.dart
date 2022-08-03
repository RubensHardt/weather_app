import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'city_search_delegate.dart';
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
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CitySearchDelegate(viewModel.weathers),
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: viewModel.isLoading ? _loading() : _content(),
        );
      },
    );
  }

  Widget _loading() => const Center(child: CircularProgressIndicator());

  Widget _content() => CitiesWeatherList(viewModel.weathers);
}
