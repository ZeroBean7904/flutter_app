
import 'package:flutter/material.dart';
import 'package:flutter_app_project/data/global.dart';
import 'package:flutter_app_project/data/survey2data.dart';
import 'package:flutter_app_project/screens/submit.dart';
//import 'dart:convert';

class Survey2 extends StatefulWidget {
  const Survey2({super.key});

  @override
  State<Survey2> createState() => _Survey2State();
}

class _Survey2State extends State<Survey2> {
    int _radioValue = 0;
    late Future<S2> futuresus;

    void initState() {
      super.initState();
      futuresus=loadAsset2();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Survey Name 2', textAlign: TextAlign.center,)),
      body: FutureBuilder<S2>(
        future: futuresus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: survey2List(context, snapshot.data!),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }

  List<Widget> survey2List(BuildContext context, S2 data ){
    List<Widget> S2List = [];
    int a;
    S2List.add(
      Column(
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
            CustomRadio2(
                labels: ['1', '2', '3', '4', '5', '6', '7'],
                groupValue: _radioValue,
                onChanged: (int newValue) {
                  setState(() {
                    _radioValue = newValue;
                  });
                },
              ),
            SizedBox(height: 20,),
        ],
      )
    );
    S2List.add(
      Container(child: Column(
        children: [
          Text(data.name,style: TextStyle(fontSize: 20),),
          Text(data.greeting),
          SizedBox(height: 20,)
        ],
      ))
    );
    for (var category in data.categories){
      S2List.add(
        Text('# '+ category.name, style: TextStyle(fontSize: 30),)
      );
      S2List.add(
        SizedBox(height: 10,)
      );
      for (var factor in category.factors) {
        S2List.add(SizedBox(height: 10,));
        S2List.add(
          Text('## '+factor.name, style: TextStyle(fontSize: 30),)
        );
        S2List.add(SizedBox(height: 10,));
        a=1;
        for(var question in factor.questions){
          S2List.add(
            Text('(${a}) '+ question, style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
            );
          S2List.add(CustomRadio2(
            labels: ['1','2','3','4','5','6','7'],
            groupValue: _radioValue,
            onChanged: (int newValue) {
                  setState(() {
                    _radioValue = newValue;
                  });
                },
            ));
          S2List.add(
            SizedBox(height: 10,)
          );
          a=a+1;
        }
      }
    }
    S2List.add(
      Container(
            width: 100,
            
            child: Align(
              child: ElevatedButton(
                
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Submit2()));
              }, child: Text('submit',style: TextStyle(fontSize: 25),)),
            ),
          )
    );
    return S2List;
  }
}

class CustomRadio2 extends StatefulWidget {
  final List<String> labels;
  final int groupValue;
  final Function(int) onChanged;

  const CustomRadio2({
    required this.labels,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  _CustomRadioState2 createState() => _CustomRadioState2();
}

class _CustomRadioState2 extends State<CustomRadio2> {
  
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.labels.length, (index) {
        final int value = index + 1;
        return InkWell(
          onTap: () {
            if (widget.groupValue != value) widget.onChanged(value);
          },
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Text(
                '${widget.labels[index]}',
                style: TextStyle(fontSize: 16),
              ),
                ],
              ),
              Row(
                children: <Widget>[
                  
                  Radio(
                    value: value,
                    groupValue: widget.groupValue,
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        widget.onChanged(newValue);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
