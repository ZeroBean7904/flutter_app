import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/bmi_screen.dart';
import 'package:flutter_application_1/screens/intro_screen.dart';
import 'package:flutter_application_1/screens/performance_screen.dart';
import 'package:flutter_application_1/screens/weather_screen.dart';

void main(){
  runApp(const HelloApp());
}

class HelloApp extends StatelessWidget {
  const HelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo), // 이거 왜 안되는 거야
      routes: {
        '/':(context) => IntroScreen(),
        '/bmi':(context) => BmiScreen(),
        '/weather':(context) => WeatherScreen(),
        '/performance':(context) => PerformanceScreen(),
      },
      initialRoute: '/',
      //home: IntroScreen(),
    );
  }
}
