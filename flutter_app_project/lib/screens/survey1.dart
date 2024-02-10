import 'package:flutter/material.dart';
import 'package:flutter_app_project/screens/submit.dart';

class Survey1 extends StatelessWidget {
  const Survey1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Survey Name 1', textAlign: TextAlign.center,)),
      body: ListView(
        children: 

          survey1List(context),
          
      ),
    );
  }

  List<Widget> survey1List(BuildContext context){
    List<Widget> a = [];
    ElevatedButton(
      child: Text('submit'),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Submit()));
    },);
    return a;
  }
}