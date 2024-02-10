import 'package:flutter/material.dart';
import 'package:flutter_app_project/screens/submit.dart';

class Survey2 extends StatelessWidget {
  const Survey2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Survey Name 2')),
      body: ListView(
        children: survey2List(context),
      ),
    );
  }

   List<Widget> survey2List(BuildContext context){
    List<Widget> a = [];
    ElevatedButton(
      child: Text('submit'),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Submit()));
    },);
    return a;
   }
}