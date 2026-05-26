import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/auth/presentation/page/first_page.dart';
import 'package:scot/features/auth/presentation/repo/auth_repo.dart';
import 'package:scot/features/cart/cubit/product_cubit_cubit.dart';
import 'package:scot/features/cart/presentation/repo/product_repo.dart';
import 'package:scot/features/home/cubit/category_cubit_cubit.dart';
import 'package:scot/features/home/presentation/pages/home_categories_page.dart';
import 'package:scot/features/home/presentation/pages/home_first_page.dart';
import 'package:scot/features/home/repo/category_repo.dart';
import 'package:scot/features/settings/cubit/cubit_Address/addadres_cubit.dart';
import 'package:scot/features/settings/cubit/cubit_Address/get_adress_cubit.dart';
import 'package:scot/features/settings/cubit/cubit_profil/profil_cubit.dart';
import 'package:scot/features/settings/presentation/pages/add_adress.dart';
import 'package:scot/features/settings/presentation/pages/adress.dart';
import 'package:scot/features/settings/presentation/pages/firs_page_settings.dart';
import 'package:scot/features/settings/presentation/repo/adres_repo.dart';
import 'package:scot/features/settings/presentation/repo/get_adres_repo.dart';
import 'package:scot/features/settings/presentation/repo/profil_repo.dart';
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
        BlocProvider(
          create: (context) => CategoryCubitCubit(repo: CategoryRepo()),
        ),
        BlocProvider(create: (context) => ProductCubit(repo: ProductsRepo())),
        BlocProvider(create: (context) => ProfilCubit(ProfilRepo())),
        BlocProvider(create: (context) => AddadresCubit(AddressRepo())),
                BlocProvider(create: (context) => GetAddressesCubit(GetAdresRepo())),

      ],

      child: MaterialApp(
        home: const Adress(),
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
