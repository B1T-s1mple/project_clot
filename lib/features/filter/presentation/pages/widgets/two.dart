import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/cart/cubit/product_cubit_cubit.dart';
import 'package:scot/features/cart/cubit/product_cubit_state.dart';
import 'package:scot/features/cart/model/products_model.dart';
import 'package:scot/features/home/presentation/pages/home_products_page.dart';

// ignore: camel_case_types
class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductCubit>().getProducts();

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
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const CircularProgressIndicator.adaptive();
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                } else if (state is ProductsLoaded) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final ProductModel product = state.products[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeProductsPage(),
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
                          child:  Row(
                            children: [SizedBox(width: 20), Text(product.name)],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                    itemCount: state.products.length,
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
