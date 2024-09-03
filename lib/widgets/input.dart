import 'package:flutter/material.dart';
import 'package:currency_application_1/utilities/currency_provider.dart';
import 'package:provider/provider.dart';

class Input extends StatelessWidget {
  final bool isFirstCountry;

  const Input(TextEditingController textEditingController, {super.key, required this.isFirstCountry});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CurrencyProvider>(context);

    return TextField(
      controller:
          isFirstCountry ? value.controllerFirst : value.controllerSecond,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Color(0xFF3C3C3C),
        overflow: TextOverflow.clip,
      ),
      textAlign: TextAlign.right,
      textAlignVertical: TextAlignVertical.top,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color(0xFFEFEFEF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          borderSide: BorderSide.none,
        ),
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
    );
  }
}
