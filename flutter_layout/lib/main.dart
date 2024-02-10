import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light, 
        primarySwatch: Colors.blueGrey,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontSize: 10,
            fontStyle: FontStyle.italic
          )
        )
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('layout')),
        body: const Center(
          child: Text('안녕하세요 플러터 입니다', style: TextStyle(fontSize: 24),),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.lightbulb),
          onPressed: () => print('눌렀냐?'),
          ),
        persistentFooterButtons: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_alarm)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_comment))
        ],
      ),
    );
  }
}