import 'package:currency_application_1/utilities/app_colors.dart';
import 'package:currency_application_1/widgets/changer.dart';
import 'package:currency_application_1/widgets/selected_country.dart';
import 'package:flutter/material.dart';

class ConvertorBox extends StatefulWidget {
  const ConvertorBox({super.key});

  @override
  State<ConvertorBox> createState() => _ConvertorBoxState();
}

class _ConvertorBoxState extends State<ConvertorBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 4,
            color: AppColors.black.withOpacity(0.05),
          )
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Amount',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 14),
          SelectedCountry(
            isFirstCountry: true,
          ),
          Changer(),
          Text(
            'Converted Amount',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          SelectedCountry(
            isFirstCountry: false,
          ),
        ],
      ),
    );
  }
}
