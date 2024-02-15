import 'package:flutter/material.dart';
import 'package:flutter_app_project/screens/survey1.dart';
import 'package:flutter_app_project/screens/survey2.dart';

class SurveyChoice extends StatelessWidget {
  const SurveyChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Survey List'),),
      body: ListView(
        children: SurveyList(context),
      ));
  }
}

List<Widget> SurveyList(BuildContext context){
  final List<String> surveyTittle = ['Survey Name 1', 'Survey Name 2'];
  List<Widget> boxList = [];
  boxList.add(Container(
    color: Colors.black,
  ));

  for(var element in surveyTittle){
    Widget screen = Container(width: 200,);
    boxList.add(ListTile(
      title: Text(element, style: const TextStyle(fontSize: 40), textAlign: TextAlign.center,),
      onTap: () {
        switch(element){
          case 'Survey Name 1':
            screen = Survey1();break;
          case 'Survey Name 2':
            screen = Survey2();break;
        }
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => screen)
        );
      },
    ));
  }

  return boxList;
}

