import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class TextFeldPrimary extends StatelessWidget {
  final String hintTextl;
  const TextFeldPrimary({super.key, required this.hintTextl});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: AppColor.secondaryColors,
        filled: true,
        hintText: hintTextl,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
