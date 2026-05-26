import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/cart/cubit/product_cubit_cubit.dart';
import 'package:scot/features/cart/cubit/product_cubit_state.dart';
import 'package:scot/features/filter/presentation/pages/widgets/new_page.dart';
import 'package:scot/features/filter/presentation/pages/widgets/one.dart';
import 'package:scot/features/filter/presentation/pages/widgets/three.dart';
import 'package:scot/features/filter/presentation/pages/widgets/two.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<Widget> control = [const Category(), const NotFound(), const Three()];
  final serachcontroller = TextEditingController();
  int con = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: .min,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColor.secondaryColors,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_left_rounded,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 9),
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: serachcontroller,
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        con = 0;
                      } else {
                        con = 2;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        serachcontroller.text = '';
                      },
                      icon: const Icon(Icons.close),
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(fontSize: 14),
                    fillColor: AppColor.secondaryColors,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: con == 0
          ? const Category()
          : BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                // if (state is ProductsLoaded) {
                //   if (state.products.isEmpty) {
                //     return const NotFound();
                //   }
                //   return const Three();
                // }
                return NewPage(lyuboy:['btrv','uybin','rdtfy'] );
              },
            ),
    );
  }
}
