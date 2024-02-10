import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/menu_bottom.dart';
import 'package:flutter_application_1/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Helloworld'),),
        drawer: MenuDrawer(),
        bottomNavigationBar: MenuBottom(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover)
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white70),
              child: Text('ㅋㅋㅋㅋ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22))))),
      );
  }
}