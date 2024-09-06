import 'package:currency_application_1/utilities/app_colors.dart';
import 'package:currency_application_1/utilities/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RateInfo extends StatelessWidget {
  const RateInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CurrencyProvider>();
    final from = provider.firstCountry;
    final to = provider.secondCountry;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Indicative Exchange Rate',
          style: TextStyle(
            color: AppColors.inActive,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          '1 $from=${provider.convert(1, from!, to!).toStringAsFixed(2)}'
          " $to",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xFF000000),
          ),
        ),
      ],
    );
  }
}
