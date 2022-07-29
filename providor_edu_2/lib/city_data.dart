import 'package:flutter/material.dart';

class CityData with ChangeNotifier {
  String city = "RTw";

  changeCity(newCity) {
    city = newCity;
    notifyListeners();
  }
}
