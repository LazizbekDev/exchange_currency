import 'package:currency_application_1/utilities/app_colors.dart';
import 'package:currency_application_1/utilities/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Changer extends StatefulWidget {
  const Changer({super.key});

  @override
  State<Changer> createState() => _ChangerState();
}

class _ChangerState extends State<Changer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Consumer<CurrencyProvider>(builder: (context, value, child) {
        return Row(
          children: [
            const Expanded(
              child: Divider(
                color: AppColors.background,
                thickness: 1,
              ),
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
            const Expanded(
              child: Divider(
                color: AppColors.background,
                thickness: 1,
              ),
            ),
          ],
        );
      }),
    );
  }
}
