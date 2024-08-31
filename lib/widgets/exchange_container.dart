import 'package:currency_application_1/widgets/exchange_button.dart';
import 'package:currency_application_1/widgets/selected_country.dart';
import 'package:flutter/material.dart';

class ExchangeContainer extends StatefulWidget {
  const ExchangeContainer({super.key});

  @override
  State<ExchangeContainer> createState() => _ExchangeContainerState();
}

class _ExchangeContainerState extends State<ExchangeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                color: const Color(0xFF000000).withOpacity(0.05))
          ]),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Amount',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Color(0xFF989898),
            ),
          ),
          SizedBox(height: 14),
          SelectedCountry(
            isFirstCountry: true,
          ),
          ExchangeButton(),
          Text(
            'Converted Amount',
            style: TextStyle(
                color: Color(0xFF989898),
                fontSize: 15,
                fontWeight: FontWeight.w400),
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
