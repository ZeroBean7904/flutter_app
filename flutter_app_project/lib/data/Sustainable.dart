import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter/material.dart';
import 'package:flutter_app_project/data/survey1data.dart';

Future<S1> loadAsset() async {
  final jsonString = await rootBundle.loadString('assets/Sustainable_Development.txt');
  final jsonData = json.decode(jsonString);
  return S1.fromJson(jsonData);
}

