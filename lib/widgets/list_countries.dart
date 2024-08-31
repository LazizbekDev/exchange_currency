import 'package:flutter/material.dart';
import 'package:currency_application_1/providers/currency_provider.dart';
import 'package:provider/provider.dart';

class ListCountries extends StatelessWidget {
  final bool isFirstCountry;

  const ListCountries({super.key, required this.isFirstCountry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: const Text(
        'Currency Converter',
        style: TextStyle(
          color: Color(0xFF1F2261),
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),
      )),
      body: Consumer<CurrencyProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 14, right: 4),
                      child: Image.asset('assets/images/search.png'),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    labelText: 'search',
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFFAEAEAE)),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide.none),
                  ),
                  onChanged: (elememnt) {
                    value.searchCountry(elememnt);
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = value.filteredCountries[index];
                    bool isSelectedFirst =
                        country.ccy == value.currentCountryFirst;
                    bool isSelectedSecond =
                        country.ccy == value.controllerSecond;
                    return InkWell(
                        onTap: () {
                          value.filteredCountries = value.countries;
                          value.updateCurrentCountry(country, isFirstCountry);
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 16, left: 21, right: 21),
                          padding: const EdgeInsets.only(left: 14),
                          decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
