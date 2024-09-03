import 'package:currency_application_1/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class ExchangeRateText extends StatelessWidget {
  const ExchangeRateText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Indicative Exchange Rate',
      style: TextStyle(
        color: AppColors.inActive,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
