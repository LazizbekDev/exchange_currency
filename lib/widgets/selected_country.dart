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
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: DropdownButton<String>(
                value: isFirstCountry
                    ? value.currentCountryFirst
                    : value.currentCountrySecond,
                underline: const SizedBox.shrink(),
                items: value.result.map<DropdownMenuItem<String>>((element) {
                  return DropdownMenuItem<String>(
                    value: element.ccy,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/flag${element.id}.png',
                          width: 45,
                        ),
                        const SizedBox(width: 13),
                        Text(
                          element.ccy,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color(0xFF26278D)),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  if (newValue!.isNotEmpty) {
                    final newCurrency = value.result.firstWhere(
                      (e) => e.ccy == newValue,
                    );

                    value.updateCurrentCountry(newCurrency, isFirstCountry);
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                width: 141,
                height: 50,
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
                    border: OutlineInputBorder(),
                  ),
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
            )
          ],
        );
      },
    );
  }
}
