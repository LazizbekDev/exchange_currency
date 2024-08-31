import 'package:currency_application_1/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExchangeRateDisplay extends StatelessWidget {
  const ExchangeRateDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CurrencyProvider>();
    final toCountry = provider.currentCountrySecond;
    final fromCountry = provider.currentCountryFirst;
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Text(
        '1 $fromCountry=${provider.convert(1, fromCountry!, toCountry!).toStringAsFixed(2)}'
        " $toCountry",
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xFF000000)),
      ),
    );
  }
}
