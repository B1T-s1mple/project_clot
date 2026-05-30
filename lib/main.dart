import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/auth/presentation/repo/auth_repo.dart';
import 'package:scot/features/cart/cubit/add_cart_cubit/add_to_Bag_cubit.dart';
import 'package:scot/features/cart/cubit/product_cubit_cubit.dart';
import 'package:scot/features/cart/presentation/repo/add_to_Bag_repo.dart';
import 'package:scot/features/cart/presentation/repo/product_repo.dart';
import 'package:scot/features/home/cubit/category_cubit_cubit.dart';
import 'package:scot/features/home/presentation/pages/home_first_page.dart';
import 'package:scot/features/home/repo/category_repo.dart';
import 'package:scot/features/settings/cubit/cubit_Address/addadres_cubit.dart';
import 'package:scot/features/settings/cubit/cubit_Address/get_adress_cubit.dart';
import 'package:scot/features/settings/cubit/cubit_card/add_card_cubit.dart';
import 'package:scot/features/settings/cubit/cubit_card/get_card_cubit.dart';
import 'package:scot/features/settings/cubit/cubit_profil/profil_cubit.dart';
import 'package:scot/features/settings/presentation/repo/adres_repo.dart';
import 'package:scot/features/settings/presentation/repo/card_repo.dart';
import 'package:scot/features/settings/presentation/repo/get_adres_repo.dart';
import 'package:scot/features/settings/presentation/repo/get_card_repo.dart';
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
        BlocProvider(create: (context) => AddCardCubit(Cardrepo())),
        BlocProvider(create: (context) => GetCardCubit(GetCardRepo())),
        BlocProvider(create: (context) => AddToBagCubit(repo: AddToBagRepo())),
      ],

      child: MaterialApp(
        home: const HomeFirstPage(),
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
