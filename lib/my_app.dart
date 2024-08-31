import 'package:currency_application_1/providers/currency_provider.dart';
import 'package:currency_application_1/widgets/exchange_button.dart';
import 'package:currency_application_1/widgets/selected_country.dart';
import 'package:currency_application_1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? currentCountry;

  @override
  void initState() {
    super.initState();
    Provider.of<CurrencyProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(builder: (context, value, child) {
      final fromCountry = value.currentCountryFirst;
      final toCountry = value.currentCountrySecond;
      return MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color(0xFFF6F6F6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFFFFFFF),
                    ),
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
                        SelectedCountry(
                          isFirstCountry: false,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Indicative Exchange Rate',
                    style: TextStyle(
                        color: Color(0xFFA1A1A1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  if (fromCountry != null && toCountry != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: Text(
                        '1 $fromCountry=${value.convert(1, fromCountry, toCountry).toStringAsFixed(2)}'
                        " $toCountry",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xFF000000)),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<CurrencyProvider>(context, listen: false).getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CurrencyProvider>(builder: (context, value, child) {
//       return MaterialApp(
//         home: Scaffold(
//           body: ListView.builder(
//             itemCount: value.result.length,
//             itemBuilder: (context, index) {
//               final currency = value.result[index];
//               return ListTile(
//              leading: Image.asset('assets/images/flag${currency.id}.png',width: 45,),
                
//                 title: Text(currency.ccy),
//                 subtitle: Text('rate: ${currency.rate}'),
//                 trailing: Text('Diff: ${currency.diff}'),
              
//               );
//             },
//           ),
//         ),
//       );
//     });
//   }
// }

