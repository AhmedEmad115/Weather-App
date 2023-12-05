import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/Views/home_view.dart';
import 'package:untitled2/cubit/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child:  MaterialApp(
        theme: ThemeData(
          primarySwatch: getThemeColor(),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
MaterialColor getThemeColor(String condition){
  switch (condition){
    case 'Sunny':
      return Colors.orange;
    case 'Cloudy':
      return Colors.grey;
    case 'Rainy' :
      return Colors.blueGrey;
  }
}