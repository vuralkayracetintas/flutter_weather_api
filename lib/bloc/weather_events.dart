import 'package:equatable/equatable.dart';

abstract class WeatherEvents extends Equatable {
  const WeatherEvents();
}

class WeatherLoadData extends WeatherEvents {
  const WeatherLoadData();

  @override
  List<Object> get props => [];
}
