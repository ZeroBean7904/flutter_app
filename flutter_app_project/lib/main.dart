
import 'package:flutter/material.dart';
import 'package:flutter_app_project/screens/intro_main.dart';
import 'package:flutter_app_project/screens/survey_choice.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      routes: {
        '/':(context) => AppMain(),
        '/surveychoice':(context) => SurveyChoice(),
      },
      initialRoute: '/',
    );
  }
}