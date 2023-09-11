import 'package:flutter/material.dart';
import 'package:flutter_weather_api/bloc/weather_states.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key, required this.state});

  @override
  State<HomeView> createState() => _HomeViewState();
  final WeatherLoadedState state;
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        // Text(
        //   getWeatherCondition(state.weatherModel.main.temp),
        //   style: TextStyle(
        //       fontSize: 24), // İstenirse metin boyutunu ayarlayabilirsiniz
        // ),
        Text(
          DateFormat('dd MMM yyyy').format(DateTime.now().toLocal()),
        ),
        Icon(
          Icons.wb_sunny_rounded,
          color: Colors.amber,
          size: 100,
        ),
        Text(
          widget.state.weatherModel.name,
          style: context.general.textTheme.displayLarge,
        ),
        Text(
          '${(widget.state.weatherModel.main.temp.toString())}°C',
          style: context.general.textTheme.displayMedium,
        ),
        Text(
          widget.state.weatherModel.weather[0].main,
          style: context.general.textTheme.displaySmall,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Wind : ${widget.state.weatherModel.wind.speed.toString()}',
              style: context.general.textTheme.titleMedium,
            ),
            Text(
              'humidity : ${widget.state.weatherModel.main.humidity.toString()}',
              style: context.general.textTheme.titleMedium,
            )
          ],
        ),
      ],
    ));
  }
}
