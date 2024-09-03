import 'package:currency_application_1/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class ConverterText extends StatelessWidget {
  const ConverterText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 69, top: 30, bottom: 109),
      child: Text(
        'Currency Converter',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
