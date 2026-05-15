import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class TextFeldPrimary extends StatefulWidget {
  final String hintTextl;
  final TextEditingController controlerprimary;

  TextFeldPrimary({super.key, required this.hintTextl, required this.controlerprimary});

  @override
  State<TextFeldPrimary> createState() => _TextFeldPrimaryState();
}

class _TextFeldPrimaryState extends State<TextFeldPrimary> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controlerprimary,
      decoration: InputDecoration(
        fillColor: AppColor.secondaryColors,
        filled: true,
        hintText: widget.hintTextl,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
