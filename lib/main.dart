import 'package:currency_application_1/my_app.dart';
import 'package:currency_application_1/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CurrencyProvider())],
      child: const MyApp()));
}
