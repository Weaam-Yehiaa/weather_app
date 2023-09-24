import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/home_screen_impl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenImpl();
  }
}
