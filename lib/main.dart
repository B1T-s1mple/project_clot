import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/auth/presentation/page/xz_page.dart';
import 'package:scot/features/auth/presentation/repo/auth_repo.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo()),
      child: MaterialApp(
        home: XzPage(),
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