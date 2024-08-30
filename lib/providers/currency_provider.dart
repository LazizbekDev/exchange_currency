import 'package:currency_application_1/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyProvider with ChangeNotifier {
  List<CurrencyModel> _result = [];
  List<CurrencyModel> get result => _result;
  String? currentCountryFirst;
  String? currentCountrySecond;

  Future<void> getData() async {
    final response = await http
        .get(Uri.parse('https://cbu.uz/oz/arkhiv-kursov-valyut/json/'));

    if (response.statusCode == 200) {
      final List<dynamic> document = json.decode(response.body);
      _result = document
          .map((item) => CurrencyModel.fromJson(item as Map<String, dynamic>))
          .toList();
      _result
          .add(const CurrencyModel(id: "76", ccy: "UZB", rate: "1", diff: "1"));
      if (_result.isNotEmpty) {
        currentCountryFirst = _result.first.ccy;
        currentCountrySecond = _result.last.ccy;
      }
      notifyListeners();
    }
  }

  void updateCurrentCountry(CurrencyModel newValue, bool isFirsttCountry) {
    if (isFirsttCountry) {
      currentCountryFirst = newValue.ccy;
    } else {
      currentCountrySecond = newValue.ccy;
    }

    notifyListeners();
  }

  double convert(double amount, String from, String to) {
    CurrencyModel fromCountry = result.firstWhere((e) => e.ccy == from);
    CurrencyModel toCountry = result.firstWhere((e) => e.ccy == to);
    final fromRate = double.parse(fromCountry.rate);
    final toRate = double.parse(toCountry.rate);
    return amount * (fromRate) / toRate;
  }

  void exchangeCountry() {
    String temp = currentCountryFirst!;
    currentCountryFirst = currentCountrySecond;
    currentCountrySecond = temp;
    notifyListeners();
  }
}
