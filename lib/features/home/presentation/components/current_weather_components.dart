
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';

import '../../../../shared/methods.dart';
import '../manager/current_weather_cubit/current_weather_cubit.dart';
import '../manager/current_weather_cubit/currentweather_states.dart';

class CurrentWeatherViewBlocBuilder extends StatelessWidget {
  const CurrentWeatherViewBlocBuilder({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherCubit,CurrentWeatherStates>(
        builder: (context,state){
          if(state is CurrentWeatherSuccess)
          {

            return CurrentWeatherView(
              width: width,
              height: height,
              currentWeatherModel: state.currentWeatherModel,
            );
          }
          else if(state is CurrentWeatherFailure)
          {
            print(state.errMessage);
            return Center(child: Text(state.errMessage));
          }
          else{

            return SizedBox(
                height: height/3,
                child: Center(child: const CircularProgressIndicator()),
            );
          }
        }

    );
  }
}


class CurrentWeatherView extends StatelessWidget {
  const CurrentWeatherView({
    super.key,
    required this.width,
    required this.height,
    required this.currentWeatherModel,
  });

  final double width;
  final double height;
  final CurrentWeatherModel currentWeatherModel;

  @override
  Widget build(BuildContext context) {
    var icon_url = "http://openweathermap.org/img/w/" + "${currentWeatherModel.weather![0].icon}"+".png";
    return Center(
      child: Column(
        children: [
          CurrentWeatherCard(
            width: width,
            height: height,
            city: '${currentWeatherModel.name}',
            temp: '${(currentWeatherModel.main!.temp! - 273.15).round()}',
            status: '${currentWeatherModel.weather![0].main}',
            icon_url:icon_url,
          ),
          SizedBox(
            height: 15,
          ),
          DetailsCard(
              height: height,
              width: width,
              icon:FontAwesomeIcons.meteor,
              cardName: 'Pressure ',
              cardValue: '${currentWeatherModel.main!.pressure} hPa'
          ),
          SizedBox(
            height: 15,
          ),
          DetailsCard(
              height: height,
              width: width,
              icon: FontAwesomeIcons.wind,
              cardName: 'Wind',
              cardValue: '${currentWeatherModel.wind!.speed} km/h'),
          SizedBox(
            height: 15,
          ),
          DetailsCard(
              height: height,
              width: width,
              icon: Icons.water_drop,
              cardName: 'Humidity',
              cardValue: '${currentWeatherModel.main!.humidity} %'),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

Widget CurrentWeatherCard({
  required double width,
  required double height,
  required String city,
  required String temp,
  required String status,
  required var icon_url,
})=> Container(
  height: height/3.5,
  width: width-40,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20))
  ),
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              city,
              style: TextStyle(
                fontSize: width/14,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            Spacer(),
            Text(
              getCurrentDate(),
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Container(
              height: height/6,
              width: width/2.5-40,
              decoration: BoxDecoration(
                image:DecorationImage(
                  image: AssetImage( 'assets/images/weathe.png'),
                  fit: BoxFit.cover,
                ),

                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),

              ),


            ),
            SizedBox(width: width/5,),
            Column(
              children: [

                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      temp,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: width/12,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      'o',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: width/20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      status,
                      style:  TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w400,
                          fontSize: width/17,
                      ),
                    ),
                    Image.network(
                        icon_url,
                        color: Colors.blueAccent,

                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ),
);


Widget DetailsCard({
  required double height,
  required double width,
  required IconData icon,
  required String cardName,
  required String cardValue,
})=>Container(
  height: height/11,
  width: width-40,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20))
  ),
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.blueAccent,
          size: width/15,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          cardName,
          style: TextStyle(
            fontSize: 18,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Text(
          cardValue,
          style: TextStyle(
            fontSize: 18,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
          ),
        ),


      ],
    ),
  ),
);