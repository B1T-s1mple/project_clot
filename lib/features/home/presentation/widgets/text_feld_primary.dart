import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class TextFeldPrimary extends StatelessWidget {
  const TextFeldPrimary({super.key});

  @override
  Widget build(BuildContext context) {
    return text_feld_primary(hintText: 'Email');
  }
}

text_feld_primary({required String hintText}) {
  return TextFormField(
    decoration: InputDecoration(
      fillColor: AppColor.secondaryColors,
      filled: true,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
