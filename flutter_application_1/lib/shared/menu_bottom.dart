import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index){
            switch (index){
              case 0:
                Navigator.pushNamed(context, '/');
                break;
              case 1:
                Navigator.pushNamed(context, '/bmi');
                break;
              case 2:
                Navigator.pushNamed(context, '/weather');
                break;
              case 3:
                Navigator.pushNamed(context, '/performance');
                break;
              default:
            }
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'Home', ),
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: '체질량',),
            BottomNavigationBarItem(icon: Icon(Icons.circle), label: '날씨',),
            //BottomNavigationBarItem(icon: Icon(Icons.book), label: '독서',), // 왜 이거만 생기면 살아지는 거야
          ]
    );
  }
}