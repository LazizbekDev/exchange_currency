import 'package:currency_application_1/widgets/list_countries.dart';
import 'package:currency_application_1/utilities/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedCountry extends StatelessWidget {
  final bool isFirstCountry;
  const SelectedCountry({super.key, required this.isFirstCountry});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(
      builder: (context, value, child) {
        final currentCountryFirst =
            value.countries.firstWhere((e) => e.ccy == value.firstCountry);
        final currentCountrySecond =
            value.countries.firstWhere((e) => e.ccy == value.secondCountry);

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ListCountries(isFirstCountry: isFirstCountry),
              ),
            );
          },
          child: Row(children: [
            Image.asset(
              'assets/images/flag${isFirstCountry ? currentCountryFirst.id : currentCountrySecond.id}.png',
              width: 45,
            ),
            const SizedBox(
              width: 13,
            ),
            Expanded(
              child: Text(
                isFirstCountry
                    ? currentCountryFirst.ccy
                    : currentCountrySecond.ccy,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xFF26278D)),
              ),
            ),
            const SizedBox(
              width: 8.29,
            ),
            Image.asset('assets/images/vector.png'),
            const Spacer(),
            Expanded(
              flex: 3,
              child: TextField(
                controller: isFirstCountry
                    ? value.controllerFirst
                    : value.controllerSecond,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFF3C3C3C),
                    overflow: TextOverflow.clip),
                textAlign: TextAlign.right,
                textAlignVertical: TextAlignVertical.top,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFEFEFEF),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide: BorderSide.none),
                ),
                onChanged: (element) {
                  if (element.isEmpty) {
                    if (isFirstCountry) {
                      value.controllerSecond.clear();
                    } else {
                      value.controllerFirst.clear();
                    }
                  } else {
                    value.updateConversion(isFirstCountry: isFirstCountry);
                  }
                },
              ),
            ),
          ]),
        );
      },
    );
  }
}
