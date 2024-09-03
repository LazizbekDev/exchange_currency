import 'package:currency_application_1/screens/home.dart';
import 'package:currency_application_1/utilities/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CurrencyProvider(),
        ),
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}