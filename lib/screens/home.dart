import 'package:currency_application_1/utilities/app_colors.dart';
import 'package:currency_application_1/widgets/exchange_container.dart';
import 'package:currency_application_1/widgets/exchange_rate_display.dart';
import 'package:currency_application_1/widgets/exchange_rate_text.dart';
import 'package:currency_application_1/widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:currency_application_1/utilities/currency_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<CurrencyProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          home: Scaffold(
            resizeToAvoidBottomInset: true,
            body: provider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: AppColors.background,
                      child: ListView(
                        children: const [
                          ConverterText(),
                          ExchangeContainer(),
                          ExchangeRateText(),
                          ExchangeRateDisplay(),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
