import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/cart/cubit/product_cubit_cubit.dart';
import 'package:scot/features/cart/cubit/product_cubit_state.dart';
import 'package:scot/features/cart/model/products_model.dart';

class HomeProductsPage extends StatefulWidget {
  const HomeProductsPage({super.key, this.categoryid});
  final int? categoryid;
  @override
  State<HomeProductsPage> createState() => _HomeProductsPageState();
}

class _HomeProductsPageState extends State<HomeProductsPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductCubit>().getProducts(categoryId: widget.categoryid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,

        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        titleSpacing: 24,
        title: IconButton(
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: .max,
          children: [
            const Row(
              children: [
                Text(
                  'Hoodies (240)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 23),
            Expanded(
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const CircularProgressIndicator.adaptive();
                  } else if (state is ProductError) {
                    return Center(child: Text(state.message));
                  } else if (state is ProductsLoaded) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 30,
                            mainAxisExtent: 281,
                          ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final ProductModel product = state.products[index];
                        return Column(
                          children: [
                            Container(
                              height: 281,
                              decoration: BoxDecoration(
                                color: AppColor.secondaryColors,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                        image: DecorationImage(image: NetworkImage(product.images[index])),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: .end,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.favorite_border,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                   Row(
                                    children: [
                                      const SizedBox(width: 4),
                                      Text(
                                        product.name,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                   Row(
                                    children: [
                                      const SizedBox(width: 4),
                                      Text(
                                        product.price.toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
