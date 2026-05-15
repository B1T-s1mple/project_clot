import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/auth/presentation/repo/auth_repo.dart';
// O'zingizning AuthCubit va AuthRepo fayllaringiz yo'lini import qiling:
import 'features/auth/presentation/cubit/auth_cubit.dart'; 
import 'features/auth/presentation/page/first_page.dart'; // FirstPage yo'li

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp'ni BlocProvider bilan o'raymiz
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo()),
      child: MaterialApp(
        home: FirstPage(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}