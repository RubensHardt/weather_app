# weather_app

A simple weather app tracker.

The app tracks the current weather and the forecast for the 5 next days of the following cities:

- Silverstone, UK
- São Paulo, Brazil
- Melbourne, Australia
- Monte Carlo, Monaco

## Contents

The app has two screens:

- Current weather list
- Forecast for the next 5 days

It has a search feature in the main screen (by city).

It uses [Get It](https://pub.dev/packages/get_it) for dependency injection and a MVVM architecture using [MobX](https://pub.dev/packages/mobx) for state-management.

It has local persistence implemented using Hive[https://pub.dev/packages/hive]. 

## Weather retrieval

It's based on the [OpenWeather](https://openweathermap.org) API. You can create a [free account](https://home.openweathermap.org/users/sign_up) and get your [API key](https://home.openweathermap.org/api_keys).

API documentation:
- https://openweathermap.org/current
- https://openweathermap.org/forecast

## Running the app

To run the app, replace the **apiKey** in the **RemoteDataSource** with your API key.
