import 'package:flutter/material.dart';
import 'package:currency_application_1/providers/currency_provider.dart';
import 'package:provider/provider.dart';

class ListCountries extends StatelessWidget {
  final bool isFirstCountry;

  const ListCountries({super.key, required this.isFirstCountry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            isFirstCountry ? 'Select First Country' : 'Select Second Country'),
      ),
      body: Consumer<CurrencyProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.result.length,
            itemBuilder: (context, index) {
              final country = value.result[index];
              bool isSelectedFirst = country.ccy == value.currentCountryFirst;
              bool isSelectedSecond = country.ccy == value.controllerSecond;
              return InkWell(
                  onTap: () {
                    value.updateCurrentCountry(country, isFirstCountry);
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16, left: 21, right: 21),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 318,
                    height: 73,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/flag${country.id}.png',
                          width: 45,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          country.ccy,
                          style: const TextStyle(
                              color: Color(0xFF26278D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 167,
                        ),
                        Image.asset(isSelectedFirst || isSelectedSecond
                            ? "assets/images/selected.png"
                            : "assets/images/unselected.png")
                      ],
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}
