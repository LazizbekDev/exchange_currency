import 'package:currency_application_1/utilities/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExchangeRateDisplay extends StatelessWidget {
  const ExchangeRateDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CurrencyProvider>();
    final from = provider.firstCountry;
    final to = provider.secondCountry;
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Text(
        '1 $from=${provider.convert(1, from!, to!).toStringAsFixed(2)}'
        " $to",
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xFF000000)),
      ),
    );
  }
}
