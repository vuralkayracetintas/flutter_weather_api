import 'package:equatable/equatable.dart';
import 'package:flutter_weather_api/product/model/weather_model.dart';

abstract class WeatherStates extends Equatable {
  const WeatherStates();
}

class WeatherInitialState extends WeatherStates {
  @override
  List<Object?> get props => [];
}

class WeatherLoadingState extends WeatherStates {
  @override
  List<Object?> get props => [];
}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weatherModel;
  WeatherLoadedState(this.weatherModel);
  @override
  List<Object?> get props => [weatherModel];
}

class WeatherErrorState extends WeatherStates {
  final String message;

  const WeatherErrorState(this.message);
  @override
  List<Object?> get props => [message];
}
