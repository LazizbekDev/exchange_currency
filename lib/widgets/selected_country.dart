import 'package:currency_application_1/list_countries.dart';
import 'package:currency_application_1/providers/currency_provider.dart';
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
            value.result.firstWhere((e) => e.ccy == value.currentCountryFirst);
        final currentCountrySecond =
            value.result.firstWhere((e) => e.ccy == value.currentCountrySecond);
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ListCountries(isFirstCountry: isFirstCountry)));
          },
          child: Row(children: [
            Image.asset(
              'assets/images/flag${isFirstCountry ? currentCountryFirst.id : currentCountrySecond.id}.png',
              width: 45,
            ),
            const SizedBox(
              width: 13,
            ),
            Text(
              isFirstCountry
                  ? currentCountryFirst.ccy
                  : currentCountrySecond.ccy,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xFF26278D)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.29, right: 22),
              child: Image.asset('assets/images/vector.png'),
            ),
            SizedBox(
              width: 141,
              height: 45,
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
                        borderSide: BorderSide.none)),
                onChanged: (element) {
                  if (element.isEmpty && isFirstCountry) {
                    value.controllerSecond.text = "";
                  } else if (element.isEmpty && !isFirstCountry) {
                    value.controllerSecond.text = "";
                  }
                  if (element.isNotEmpty) {
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
