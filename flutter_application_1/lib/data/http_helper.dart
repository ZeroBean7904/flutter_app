import 'package:flutter_application_1/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //https://api.openweathermap.org/data/3.0/onecall/timemachine?lat=39.099724&lon=-94.578331&dt=1643803200&appid=d70ed5098f376308e1cb8ad12cfea974

  final String domain = 'api.openweathermap.org';
  final String path = 'data/3.0/onecall/timemachine';
  final String apikey = 'd70ed5098f376308e1cb8ad12cfea974';

  Future<Weather> getWeather(String lat, String lon, String dt) async {
    Map<String, dynamic> parameters = {'lat': lat, 'lon': lon, 'dt': dt,'appid':apikey};
    Uri uri =Uri.https(domain, path, parameters);
    http.Response result = await http.get(uri);

    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}