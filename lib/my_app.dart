import 'package:currency_application_1/widgets/exchange_container.dart';
import 'package:currency_application_1/widgets/exchange_rate_display.dart';
import 'package:currency_application_1/widgets/exchange_rate_text.dart';
import 'package:currency_application_1/widgets/converter_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:currency_application_1/providers/currency_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<CurrencyProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          home: Scaffold(
            resizeToAvoidBottomInset: true,
            body: provider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: const Color(0xFFF6F6F6),
                      child: ListView(
                        children: const [
                          ConverterText(),
                          ExchangeContainer(),
                          ExchangeRateText(),
                          ExchangeRateDisplay()
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
