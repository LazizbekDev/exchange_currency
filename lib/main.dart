import 'package:currency_application_1/screens/home.dart';
import 'package:currency_application_1/utilities/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrencyProvider()),
      ],
      child: const Home(),
    ),
  );
}
