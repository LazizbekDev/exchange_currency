import 'package:flutter/material.dart';
import 'package:currency_application_1/models/currency_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyProvider with ChangeNotifier {
  List<CurrencyModel> _result = [];
  List<CurrencyModel> get result => _result;

  String? currentCountryFirst;
  String? currentCountrySecond;

  final TextEditingController controllerFirst = TextEditingController();
  final TextEditingController controllerSecond = TextEditingController();

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
        controllerFirst.text = "1.0";
        updateConversion(isFirstCountry: true);
      }
      notifyListeners();
    }
  }

  void updateCurrentCountry(CurrencyModel newValue, bool isFirstCountry) {
    if (isFirstCountry) {
      currentCountryFirst = newValue.ccy;
      updateConversion(isFirstCountry: true);
    } else {
      currentCountrySecond = newValue.ccy;
      updateConversion(isFirstCountry: false);
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

  void updateConversion({required bool isFirstCountry}) {
    double amount = double.parse(
        isFirstCountry ? controllerFirst.text : controllerSecond.text);
    double result = convert(
        amount,
        isFirstCountry ? currentCountryFirst! : currentCountrySecond!,
        isFirstCountry ? currentCountrySecond! : currentCountryFirst!);

    if (isFirstCountry) {
      controllerSecond.text = result.toStringAsFixed(2);
    } else {
      controllerFirst.text = result.toStringAsFixed(2);
    }
    notifyListeners();
  }

  void exchangeCountry() {
    String temp = currentCountryFirst!;
    currentCountryFirst = currentCountrySecond;
    currentCountrySecond = temp;
    updateConversion(isFirstCountry: true);
    notifyListeners();
  }
}
