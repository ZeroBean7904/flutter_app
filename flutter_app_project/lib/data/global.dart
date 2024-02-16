import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter/material.dart';
import 'package:flutter_app_project/data/survey2data.dart';

Future<S2> loadAsset2() async {
  final jsonString = await rootBundle.loadString('assets/Globlal_Competency_instrument.txt');
  final jsonData = json.decode(jsonString);
  return S2.fromJson(jsonData);
}

