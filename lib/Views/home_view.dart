import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/Model/weather_model.dart';
import 'package:untitled2/Views/search_view.dart';
import 'package:untitled2/Widgets/no_weather_body.dart';
import 'package:untitled2/Widgets/weather_info_body.dart';
import 'package:untitled2/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:untitled2/cubit/get_weather_cubit/get_weather_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App'
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)
                {
                  return SearchView();
                },),);
              },
              icon: Icon(
                Icons.search,
              ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state)
          {
            if (state is WeatherIntialState){
              return NoWeatherBody();
            }else if (state is WeatherLoadedState){
              return WeatherInfoBody();
            } else{
              return Center(child: Text('Oops there was an erorr, Try Again',
              style: TextStyle(
                fontSize: 26
              ),
              ),);
            }
          }
      )
    );
  }
}
