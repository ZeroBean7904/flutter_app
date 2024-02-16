import 'package:flutter/material.dart';
import 'package:flutter_app_project/screens/intro_main.dart';

class SurveyResultWeb extends StatelessWidget {
  const SurveyResultWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text('result'),
          SizedBox(height: 50,),
          Container(
          width: 200,
          height: 100,
          child: ElevatedButton(
            child: Text('go home',style: TextStyle(fontSize: 25),),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=> const AppMain()));
          },
          ),
        ),
        ],
      ),
    );
  }
}

class SurveyResultBar extends StatelessWidget {
  const SurveyResultBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text('result'),
          SizedBox(height: 50,),
          Container(
          width: 200,
          height: 100,
          child: ElevatedButton(
            child: Text('go home',style: TextStyle(fontSize: 25),),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=> const AppMain()));
          },
          ),
        ),
        ],
      ),
    );
  }
}