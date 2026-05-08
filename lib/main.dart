import 'package:flutter/material.dart';
import 'package:scot/features/home/presentation/notifications_prders/notification_first.dart';
import 'package:scot/features/home/presentation/pages/home_first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationFirst(),

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        
      ),
    );
  }
}
