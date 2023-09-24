import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/data/models/five_days_model.dart';
import 'package:weather_app/features/home/presentation/manager/five_days_forecast_cubit/five_days_forecast_cubit.dart';

import '../manager/five_days_forecast_cubit/five_days_forecast_states.dart';


class FiveDaysForecastBlocBuilder extends StatelessWidget {
  const FiveDaysForecastBlocBuilder({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiveDaysForecastCubit,FiveDaysForecastStates>(
      builder: (context,state){
        if(state is FiveDaysForecastSuccess)
        {

          return FiveDaysForecastView(
            height: height,
            width: width,
            fiveDaysModelList: state.fiveDaysModelList,
          );
        }
        else if(state is FiveDaysForecastFailure)
        {
          print(state.errMessage);
          return Center(child: Text(state.errMessage));
        }
        else{

          return SizedBox(
            height: height/4,
              child: Center(child: const CircularProgressIndicator())
          );
        }
      },
    );
  }
}


class FiveDaysForecastView extends StatelessWidget {
  const FiveDaysForecastView({
    super.key,
    required this.height,
    required this.width,
    required this.fiveDaysModelList,
  });

  final double height;
  final double width;
  final List<FiveDaysModel> fiveDaysModelList;

  @override
  Widget build(BuildContext context) {

    int index=-5;
    return SizedBox(
      height: height/4,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,i){
          index +=(i+5);
          print(index);
          return FiveDaysForecastCard(
            height: height,
            width: width,
            index: i+1,
            temp: fiveDaysModelList[index].temp ,
            dateTime: fiveDaysModelList[index].dateTime,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 20,);
        },
      ),
    );
  }
}

class FiveDaysForecastCard extends StatelessWidget {
  const FiveDaysForecastCard({
    super.key,
    required this.height,
    required this.width,
    required this.temp,
    required this.dateTime,
    required this.index,

  });
  final int index;
  final double height;
  final double width;
  final int? temp;
  final String? dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height/4,
      width: width/4,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Day $index',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: width/30,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: height/10,
              width: width/8,
              decoration: BoxDecoration(
                image:DecorationImage(
                  image: AssetImage( 'assets/images/weathe.png'),
                  fit: BoxFit.cover,
                ),

                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$temp',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: width/30,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Text(
                  'o',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: width/50,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            Text(
              '$dateTime',
              style:  TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: width/35,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
