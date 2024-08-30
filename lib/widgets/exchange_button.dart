import 'package:currency_application_1/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExchangeButton extends StatefulWidget {
  const ExchangeButton({super.key});

  @override
  State<ExchangeButton> createState() => _ExchangeButtonState();
}

class _ExchangeButtonState extends State<ExchangeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Consumer<CurrencyProvider>(builder: (context, value, child) {
        return Row(
          children: [
            Container(
              width: 118,
              height: 1,
              color: const Color(0xFFE7E7EE),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/exchange.png'),
                ),
              ),
              child: IconButton(
                  onPressed: () {
                    value.exchangeCountry();
                  },
                  icon: Image.asset(
                    'assets/images/exchange2.png',
                    width: 15,
                  )),
            ),
            Container(
              width: 118,
              height: 1,
              color: const Color(0xFFE7E7EE),
            ),
          ],
        );
      }),
    );
  }
}
