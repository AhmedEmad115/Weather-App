import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value) async{
             var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
             getWeatherCubit.getWeather(cityName:value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              suffixIcon: Icon(
                Icons.search
              ),
              border: OutlineInputBorder(),
              labelText: 'Search',
              hintText: 'Enter City Name',
            ),
          ),
        ),
      ),
    );
  }
}
