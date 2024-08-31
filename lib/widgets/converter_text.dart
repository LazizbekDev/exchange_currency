import 'package:flutter/material.dart';

class ConverterText extends StatelessWidget {
  const ConverterText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 69, top: 30, bottom: 109),
      child: Text(
        'Currency Converter',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1F2261),
        ),
      ),
    );
  }
}
