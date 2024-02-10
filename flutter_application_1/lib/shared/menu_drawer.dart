// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/bmi_screen.dart';
import 'package:flutter_application_1/screens/intro_screen.dart';
import 'package:flutter_application_1/screens/performance_screen.dart';
import 'package:flutter_application_1/screens/weather_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context)),
    );
  }
}

List<Widget> buildMenuItems(BuildContext context){
  final List<String> menuTittle =['Home', 'first', 'second', 'third'];
  List<Widget> menuItems = [];
  menuItems.add(const DrawerHeader(
    decoration: BoxDecoration(color: Colors.indigo),
    child: Text(
      'MENU',
      style: TextStyle(color: Colors.white,fontSize: 28),
    ),
  ));

  for(var element in menuTittle){
    Widget screen = Container();
    menuItems.add(ListTile(
      title: Text(element, style: const TextStyle(fontSize: 18),),
      onTap: (){
        switch(element){
          case 'Home':
            screen = IntroScreen();break;
          case 'first':
            screen = BmiScreen();break;
          case 'second':
            screen = WeatherScreen();break;
          case 'third':
            screen = PerformanceScreen();break;
        }
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> screen)
        );
      },
    ));
  }
  return menuItems;
}