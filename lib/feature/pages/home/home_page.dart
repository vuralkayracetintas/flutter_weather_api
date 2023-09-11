import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_api/bloc/weather_bloc.dart';
import 'package:flutter_weather_api/bloc/weather_events.dart';
import 'package:flutter_weather_api/bloc/weather_states.dart';
import 'package:flutter_weather_api/feature/pages/home/home_view.dart';
import 'package:flutter_weather_api/product/repository/weather_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getWeatherCondition(double temperature) {
    if (temperature > 30) {
      return 'icon1'; // Güneşli ikon
    } else if (temperature > 20) {
      return 'icon2'; // Parçalı bulutlu ikon
    } else {
      return 'icon3'; // Soğuk ikon
    }
  }

  Icon getWeatherIcon(String iconName) {
    switch (iconName) {
      case 'icon1':
        return Icon(Icons.wb_sunny); // Örneğin, güneşli bir ikon
      case 'icon2':
        return Icon(Icons.wb_cloudy); // Örneğin, parçalı bulutlu bir ikon
      case 'icon3':
        return Icon(Icons.ac_unit); // Örneğin, kar yağışlı bir ikon
      default:
        return Icon(Icons.cloud); // Varsayılan bir ikon
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        RepositoryProvider.of<WeatherRepository>(context),
      )..add(const WeatherLoadData()),
      child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<WeatherBloc, WeatherStates>(
              builder: (context, state) {
            if (state is WeatherInitialState || state is WeatherLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is WeatherErrorState) {
              debugPrint('error : ${state.message}');
              return Text('Getting Error: ${state.message}');
            } else if (state is WeatherLoadedState) {
              return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<WeatherBloc>(context)
                        .add(WeatherLoadData());
                  },
                  child: HomeView(
                    state: state,
                  ));
            }
            return const SizedBox.shrink();
          })),
    );
  }
}
