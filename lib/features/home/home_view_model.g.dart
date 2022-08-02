// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModel, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeViewModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$weathersAtom =
      Atom(name: '_HomeViewModel.weathers', context: context);

  @override
  List<Weather> get weathers {
    _$weathersAtom.reportRead();
    return super.weathers;
  }

  @override
  set weathers(List<Weather> value) {
    _$weathersAtom.reportWrite(value, super.weathers, () {
      super.weathers = value;
    });
  }

  late final _$_getCitiesWeatherAsyncAction =
      AsyncAction('_HomeViewModel._getCitiesWeather', context: context);

  @override
  Future<void> _getCitiesWeather() {
    return _$_getCitiesWeatherAsyncAction.run(() => super._getCitiesWeather());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
weathers: ${weathers}
    ''';
  }
}
