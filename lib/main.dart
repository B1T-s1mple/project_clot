import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/auth/presentation/page/first_page.dart';
import 'package:scot/features/auth/presentation/repo/auth_repo.dart';
import 'package:scot/features/cart/cubit/product_cubit_cubit.dart';
import 'package:scot/features/cart/presentation/page/inside_product_inforamtions.dart';
import 'package:scot/features/cart/presentation/repo/product_repo.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(AuthRepo())),
        BlocProvider(create: (context) => ProductCubit(repo: ProductsRepo())),
      ],

      child: MaterialApp(
        // ignore: prefer_const_constructors
        home: InsideProductInforamtions(),
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
