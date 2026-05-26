import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';

import 'package:scot/features/home/cubit/category_cubit_cubit.dart';
import 'package:scot/features/home/cubit/category_cubit_state.dart';
import 'package:scot/features/home/models/category_model.dart';
import 'package:scot/features/home/presentation/pages/home_products_page.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    context.read<CategoryCubitCubit>().getProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 34),
          const Row(
            children: [
              Text(
                'Shop by Categories',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Expanded(
            child: BlocBuilder<CategoryCubitCubit, CategoryCubitState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is CategoryError) {
                  return Center(child: Text(state.message));
                } else if (state is CategoryLoaded) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final CategoryModel categ = state.categorise[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeProductsPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 342,
                          height: 64,
                          decoration: BoxDecoration(
                            color: AppColor.secondaryColors,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20),
                              Text(categ.name),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                    itemCount: state.categorise.length,
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
