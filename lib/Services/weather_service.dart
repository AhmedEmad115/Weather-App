import 'dart:developer';

import 'package:dio/dio.dart';

import '../Model/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  final String baseURL = 'https://api.weatherapi.com/v1';
  final String apiKey = 'e693be12aada47768c123624233010';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async{
    try {
      Response response = await dio.get('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=10');
      
        WeatherModel weatherModel = WeatherModel.fromJason(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String erorrMessage = e.response?.data['erorr']['message']
          ?? 'Oops there was an erorr, Try later';
      throw Exception(erorrMessage);
    }
    catch (e){
      log(e.toString());
      throw Exception('Oops there was an erorr, Try later');
    }
  }
}