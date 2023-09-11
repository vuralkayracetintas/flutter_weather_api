import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_api/bloc/weather_events.dart';
import 'package:flutter_weather_api/bloc/weather_states.dart';
import 'package:flutter_weather_api/product/repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherStates> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitialState()) {
    on<WeatherLoadData>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        final weatherData = await _weatherRepository.getWeatherData();
        emit(WeatherLoadedState(weatherData));
      } catch (e) {
        emit(WeatherErrorState(e.toString()));
      }
    });
  }
}
