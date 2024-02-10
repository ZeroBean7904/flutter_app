import 'package:flutter/material.dart';
import 'package:flutter_app_project/screens/survey_result.dart';

class Submit extends StatelessWidget {
  const Submit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
        Container(
          child: DefaultTextStyle(
            child: Text('thank you for participating the survey'),
            style: TextStyle(color: Colors.black, fontSize: 20),
            ),
        ),
        SizedBox(height: 100,),
        Container(
          width: 200,
          height: 100,
          child: ElevatedButton(
            child: Text('check results',style: TextStyle(fontSize: 25),),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=> const SurveyResult()));
          },
          ),
        ),
      ]),
    );
  }
}