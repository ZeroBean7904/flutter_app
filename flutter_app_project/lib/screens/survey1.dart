
import 'package:flutter/material.dart';
import 'package:flutter_app_project/data/survey1data.dart';
import 'package:flutter_app_project/screens/submit.dart';
import 'package:flutter_app_project/data/Sustainable.dart';
//import 'dart:convert';

class Survey1 extends StatefulWidget {
  const Survey1({super.key});

  @override
  State<Survey1> createState() => _Survey1State();
}

class _Survey1State extends State<Survey1> {
    int _radioValue = 0;
    late Future<S1> futuresus;

    void initState() {
      super.initState();
      futuresus=loadAsset();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Survey Name 1', textAlign: TextAlign.center,)),
      body: FutureBuilder<S1>(
        future: futuresus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: survey1List(context, snapshot.data!),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }

  List<Widget> survey1List(BuildContext context, S1 data ){
    List<Widget> S1List = [];
    int a;
    
    S1List.add(
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
            CustomRadio(
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
    S1List.add(
      Container(child: Column(
        children: [
          Text(data.name,style: TextStyle(fontSize: 20),),
          Text(data.greeting),
          SizedBox(height: 20,)
        ],
      ))
    );
    for (var category in data.categories){
      S1List.add(
        Text('# '+category.name, style: TextStyle(fontSize: 30),)
      );
      S1List.add(
        SizedBox(height: 10,)
      );
      for (var factor in category.factors) {
        S1List.add(SizedBox(height: 10,));
        S1List.add(
          Text('## '+factor.name, style: TextStyle(fontSize: 30),)
        );
        S1List.add(SizedBox(height: 10,));
        a=1;
        for(var question in factor.questions){
          S1List.add(
            Text('(${a}) '+ question, style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
            );
          S1List.add(CustomRadio(
            labels: ['1','2','3','4','5','6','7'],
            groupValue: _radioValue,
            onChanged: (int newValue) {
                  setState(() {
                    _radioValue = newValue;
                  });
                },
            ));
          S1List.add(
            SizedBox(height: 10,)
          );
          a=a+1;
        }
      }
    }
    S1List.add(
      Container(
            width: 100,
            child: Align(
              child: ElevatedButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Submit1()));
              }, child: Text('submit',style: TextStyle(fontSize: 25),)),
            ),
          )
    );
    return S1List;
  }
}

class CustomRadio extends StatefulWidget {
  final List<String> labels;
  final int groupValue;
  final Function(int) onChanged;

  const CustomRadio({
    required this.labels,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  
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
