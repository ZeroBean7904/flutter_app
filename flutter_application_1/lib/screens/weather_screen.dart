import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/http_helper.dart';
import 'package:flutter_application_1/data/weather.dart';
import 'package:flutter_application_1/shared/menu_bottom.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather("", "", 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('openweather'),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: 
          ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                  hintText: '경도 입력',
                  suffixIcon: IconButton(
                    onPressed: getWeatherData,
                    icon: Icon(Icons.search),
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                  hintText: '위도 입력',
                  suffixIcon: IconButton(
                    onPressed: getWeatherData,
                    icon: Icon(Icons.search),
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                  hintText: '시간 입력',
                  suffixIcon: IconButton(
                    onPressed: getWeatherData,
                    icon: Icon(Icons.search),
                    )
                ),
              ),
            ),
            weatherRow('장소', result.name),
            weatherRow('설명', result.description),
            weatherRow('온도', result.temperature.toStringAsFixed(2)),
            weatherRow('체감온도', result.preceived.toStringAsFixed(2)),
            weatherRow('압력', result.pressure.toString()),
            weatherRow('습도', result.humidity.toString()),
          ],
        ),
        
      ),
      bottomNavigationBar: MenuBottom(),
    );
  }
  void getWeatherData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text,txtPlace.text,txtPlace.text);
    setState(() {});
  }
  Widget weatherRow(String label, String value){
    Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(label,style: TextStyle(fontSize: 20, color: Theme.of(context).hintColor),)
          ),
          Expanded(
            flex: 4,
            child: Text(value,style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),)
          )
      ]),
    );
    return row;
  }
}
