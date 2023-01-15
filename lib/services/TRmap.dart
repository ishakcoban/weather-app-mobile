import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:math';

readJsonFile() async {
  final String response = await rootBundle.loadString('assets/data.json');
  final data = await json.decode(response) as List;

  return data;
}

getAllCities() {
  var data = readJsonFile();
  return readJsonFile();
}
