import 'package:flutter/material.dart';

class ExchangeRateText extends StatelessWidget {
  const ExchangeRateText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Indicative Exchange Rate',
      style: TextStyle(
          color: Color(0xFFA1A1A1), fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}
