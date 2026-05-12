import 'package:flutter/material.dart';
import 'package:scot/features/filter/presentation/pages/filter_page.dart';
import 'package:scot/features/filter/presentation/pages/widgets/three.dart';
import 'package:scot/features/settings/presentation/pages/adress.dart';
import 'package:scot/features/settings/presentation/pages/firs_page_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FilterPage(),

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        
      ),
    );
  }
}
