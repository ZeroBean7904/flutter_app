import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/menu_bottom.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController textHeight = TextEditingController();
  final TextEditingController textWeight = TextEditingController();
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  late List<bool> isSelected;
  String heightTextFieldHintText = '';
  String weightTextFieldHintText = '';  

  @override
  void initState () {
    isSelected = [isMetric,isImperial];
    super.initState();
  }
  Widget build(BuildContext context) {
    heightTextFieldHintText = '키를' + ((isMetric) ? 'cm' : 'inch')+'로 넣어주세요';
    weightTextFieldHintText = '무게를' + ((isImperial) ? 'pound' : 'kg')+'로 넣어주세요';

    return Scaffold(
      appBar: AppBar(title: Text('BMI calculator'),),
      body: Column(
        children: [
          ToggleButtons(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('미터법', style: TextStyle(fontSize: 18),),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('파운드법', style: TextStyle(fontSize: 18),),)
            ],
            isSelected: isSelected,
            onPressed: toggleSelect,
            ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: textHeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: heightTextFieldHintText),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: textWeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: weightTextFieldHintText),
              ),
          ),
          
          ElevatedButton(
            onPressed: calcBmi,
            child: Text('체질량 개선',style: TextStyle(fontSize: 18),)
            ),
          Text(
            result,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
      bottomNavigationBar: MenuBottom(),
    );
  }
  void toggleSelect(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }
  void calcBmi(){
    double bmi =0;
    double height = double.tryParse(textHeight.text) ?? 0;
    double weight = double.tryParse(textWeight.text) ?? 0;
    if (isMetric){
      bmi = weight/((height/100)*(height/100));
    } else {
      bmi = weight *703/(height*height);
    }
    setState(() {
      result = '당신의 체질량 지수는' + bmi.toStringAsFixed(2) +'입니다';
    });
  }
}