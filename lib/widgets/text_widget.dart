import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

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
