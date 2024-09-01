import 'package:flutter/material.dart';
import 'package:currency_application_1/models/currency_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyProvider with ChangeNotifier {
  List<CurrencyModel> _countries = [];
  List<CurrencyModel> get countries => _countries;
  String? currentCountryFirst;
  String? currentCountrySecond;
  bool isLoading = true;
  final TextEditingController controllerFirst = TextEditingController();
  final TextEditingController controllerSecond = TextEditingController();
  List<CurrencyModel> filteredCountries = [];

  Future<void> getData() async {
    try {
      final response = await http
          .get(Uri.parse('https://cbu.uz/oz/arkhiv-kursov-valyut/json/'));

      if (response.statusCode == 200) {
        final List<dynamic> document = json.decode(response.body);
        _countries = document
            .map((item) => CurrencyModel.fromJson(item as Map<String, dynamic>))
            .toList();
        _countries.add(
            const CurrencyModel(id: "76", ccy: "UZB", rate: "1"));
        if (_countries.isNotEmpty) {
          currentCountryFirst = _countries.first.ccy;
          currentCountrySecond = _countries.last.ccy;
          controllerFirst.text = "1.0";
          updateConversion(isFirstCountry: true);
        }
        notifyListeners();
      }
    } finally {
      isLoading = false;
      filteredCountries = countries;
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
    CurrencyModel fromCountry = countries.firstWhere((e) => e.ccy == from);
    CurrencyModel toCountry = countries.firstWhere((e) => e.ccy == to);
    final fromRate = double.parse(fromCountry.rate);
    final toRate = double.parse(toCountry.rate);
    return amount * (fromRate) / toRate;
  }

  void updateConversion({required bool isFirstCountry}) {
    double amount = double.tryParse(
            isFirstCountry ? controllerFirst.text : controllerSecond.text) ??
        0;
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

  void searchCountry(String value) {
    filteredCountries = countries
        .where((e) => e.ccy.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
