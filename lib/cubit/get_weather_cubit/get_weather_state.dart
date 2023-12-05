
import 'package:untitled2/Model/weather_model.dart';

class WeatherState {}

class WeatherIntialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String erorrMessage;

  WeatherFailureState(this.erorrMessage);
}