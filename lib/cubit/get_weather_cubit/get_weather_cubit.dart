import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/Model/weather_model.dart';
import 'package:untitled2/Services/weather_service.dart';
import 'package:untitled2/cubit/get_weather_cubit/get_weather_state.dart';

class GetWeatherCubit extends Cubit <WeatherState> {
  GetWeatherCubit() : super(WeatherIntialState());
  late WeatherModel weatherModel;
  getWeather({ required String cityName }) async {
    try {
        weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel));
    }  catch (e) {
      emit(WeatherFailureState(
        e.toString()
      ));
    }
  }
}