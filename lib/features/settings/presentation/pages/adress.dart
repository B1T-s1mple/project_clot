import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class Adress extends StatefulWidget {
  const Adress({super.key});

  @override
  State<Adress> createState() => _AdressState();
}

class _AdressState extends State<Adress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
           leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColor.secondaryColors,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Adress',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}