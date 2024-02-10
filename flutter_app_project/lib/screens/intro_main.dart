import 'package:flutter/material.dart';
import 'package:flutter_app_project/screens/survey_choice.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
        Container(
          child: DefaultTextStyle(
            child: Text(' Welcome\nApp Name'),
            style: TextStyle(color: Colors.black, fontSize: 40),
            ),
        ),
        SizedBox(height: 100,),
        Container(
          width: 200,
          height: 100,
          child: ElevatedButton(
            child: Text('Get Started',style: TextStyle(fontSize: 25),),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=> const SurveyChoice()));
          },
          ),
        ),
      ]),
    );
  }
}