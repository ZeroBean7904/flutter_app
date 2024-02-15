
import 'package:flutter/material.dart';
import 'package:flutter_app_project/screens/submit.dart';
//import 'dart:convert';

class Survey1 extends StatefulWidget {
  const Survey1({super.key});

  @override
  State<Survey1> createState() => _Survey1State();
}

class _Survey1State extends State<Survey1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Survey Name 1', textAlign: TextAlign.center,)),
      body: ListView(
        children: <Widget>[
          Container(
            child: Text('choose the degree of the agreement',style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: Text('Disagree(1)'),),
                SizedBox(width: 100,),
                Container(child: Text('Agree(7)'), )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('<-------------------------------------------------------->'),
          ),
          //survey1List(context),
          
          Container(
            width: 100,
            
            child: Align(
              child: ElevatedButton(
                
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Submit()));
              }, child: Text('submit',style: TextStyle(fontSize: 25),)),
            ),
          )
        ]          
      ),
    );
  }

  List<Widget> survey1List(BuildContext context){
    List<Widget> S1List = [];

    
    return S1List;
  }
}