import 'package:flutter/material.dart';

class DropdownValues with ChangeNotifier {
  String category = '';
  String subCategory = '';
  String type = '';
  String color = '';

  String get selectedCategory => category;
  String get selectedDistrictOfIndex => subCategory;
  String get getSelectedType => type;
  String get getSelectedColor => color;

  Future<void> setCategory(value) async {
    category = value;
    notifyListeners();
  }

  Future<void> setSubCategory(value) async {
    subCategory = value;
    notifyListeners();
  }

  Future<void> setType(value) async {
    type = value;
    notifyListeners();
  }

  Future<void> setColor(value) async {
    color = value;
    notifyListeners();
  }
}
