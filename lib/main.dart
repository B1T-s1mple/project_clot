import 'package:flutter/material.dart';
import 'package:scot/features/auth/presentation/page/first_page.dart';
import 'package:scot/features/cart/presentation/page/cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        
      ),
    );
  }
}
