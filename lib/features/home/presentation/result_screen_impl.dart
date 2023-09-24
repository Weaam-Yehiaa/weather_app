import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/components/current_weather_components.dart';
import 'package:weather_app/features/home/presentation/components/five_days_forecast_copmonents.dart';
import 'package:weather_app/features/home/presentation/home_screen.dart';
import 'package:weather_app/features/home/presentation/manager/five_days_forecast_cubit/five_days_forecast_cubit.dart';
import 'package:weather_app/features/home/presentation/manager/five_days_forecast_cubit/five_days_forecast_states.dart';

class ResultScreenImpl extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: CustomScrollView(
        slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.white,Colors.blue],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                  },
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                        size: 35,
                      )
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CurrentWeatherViewBlocBuilder(width: width, height: height),
                  SizedBox(
                    height: 15,
                  ),
                  FiveDaysForecastBlocBuilder(height: height, width: width),

                ],
              ),
            ),
          ),
        )
        ],
      ),
    );
  }
}

