import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/performance.dart';
import 'package:flutter_application_1/data/sp_helper.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key});

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper helper = SPHelper();
  List<Performance> performances = [];

  @override
  void initState() {
    helper.init().then((value){
      updateScreen();
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('독서 트레이닝'),),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showPerformanceDialog(context);
        },
        ),
    );
  }
  Future<dynamic> showPerformanceDialog(BuildContext context) async{
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('독서 기록 히기'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: txtDescription,
                  decoration: InputDecoration(hintText: '책 제목&설명'),
                ),
                TextField(
                  controller: txtDuration,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: '독서량(분)'),
                ),
            ],)
            ), 
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
                txtDescription.text = '';
                txtDuration.text = '';
              }, 
              child: Text('Cancel')
            ),
            ElevatedButton(
              onPressed: savePerformance,
              child: Text('Save'))
          ],
        );
      }
    );
  }
  Future savePerformance() async{
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    int id = helper.getCounter()+1;
    Performance newPerformance = Performance(id, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    helper.writePerformance(newPerformance).then((_) {
      updateScreen();
      helper.setCounter();
    } );
    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent(){
    List<Widget> tiles = [];
    performances.forEach((performance) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_){
          helper.deletePerformance(performance.id).then((value) => updateScreen());
        },
        child: ListTile(
          title: Text(performance.description),
          subtitle: Text('${performance.date} - 기간: ${performance.duration} 분'),
        ),
      ));
    });
    return tiles;
  }
  void updateScreen(){
    performances = helper.getPerformances();
    setState(() { });
  }
}

