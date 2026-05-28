
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/cart/cubit/product_cubit_cubit.dart';
import 'package:scot/features/cart/cubit/product_cubit_state.dart';
import 'package:scot/features/cart/model/products_model.dart';
import 'package:scot/features/cart/presentation/page/inside_product_inforamtions.dart';
import 'package:scot/features/filter/presentation/pages/filter_page.dart';
import 'package:scot/features/home/cubit/category_cubit_cubit.dart';
import 'package:scot/features/home/cubit/category_cubit_state.dart';
import 'package:scot/features/home/presentation/pages/home_categories_page.dart';

class HomeFirstPage extends StatefulWidget {
  const HomeFirstPage({super.key});

  @override
  State<HomeFirstPage> createState() => _HomeFirstPageState();
}

class _HomeFirstPageState extends State<HomeFirstPage> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts(gender: '');
    context.read<CategoryCubitCubit>().getProducts();

    super.initState();
  }

  String? gender;
  bool favorite = false;
  Set<int> favoriteIndexes = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        surfaceTintColor: Colors.white,
        title: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            const CircleAvatar(radius: 20, backgroundColor: Colors.amberAccent),
            DropdownButton<String>(
              dropdownColor: AppColor.secondaryColors,
              focusColor: AppColor.secondaryColors,
              borderRadius: BorderRadius.circular(20),
              underline: const SizedBox(),
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              value: gender,
              hint: const Text('gender'),
              items: [
                const DropdownMenuItem(value: 'Men', child: Text('Men')),
                const DropdownMenuItem(value: 'Women', child: Text('Women')),
              ],
              onChanged: (value) {
                setState(() {
                  if (value == null || value == gender) return;
                  gender = value;
                });
                context.read<ProductCubit>().getProducts(gender: value);
              },
            ),
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.mark_email_read, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FilterPage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColor.secondaryColors,
                  ),
                  child: const Row(
                    spacing: 15,
                    children: [
                      SizedBox(width: 5),
                      Icon(Icons.search),
                      Text('Search'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.5),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeCategoriesPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 83,
                child: BlocBuilder<CategoryCubitCubit, CategoryCubitState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategoryError) {
                      return Center(child: Text(state.message));
                    } else if (state is CategoryLoaded) {
                      final categories = state.categorise;

                      if (categories.isEmpty) {
                        return const Center(child: Text("Kategoriya y'O"));
                      }
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];

                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<ProductCubit>().getProducts(
                                    categoryId: index + 1,
                                    gender: gender,
                                  );
                                },
                                borderRadius: BorderRadius.circular(1000),
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(
                                    category.images,
                                  ),
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 7),
                              Text(
                                category.name,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 22.5);
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  const Text(
                    'Top Selling',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.5),

              SizedBox(
                height: 281,
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductsLoading) {
                      return const CircularProgressIndicator.adaptive();
                    } else if (state is ProductError) {
                      return Center(child: Text(state.message));
                    } else if (state is ProductsLoaded) {
                      return ListView.separated(
                        itemCount: state.products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final ProductModel product = state.products[index];

                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InsideProductInforamtions(
                                            product: product,
                                          ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 199,
                                  height: 281,
                                  decoration: BoxDecoration(
                                    color: AppColor.secondaryColors,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 199,
                                        height: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade400,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              product.images.isNotEmpty
                                                  ? product.images[0]
                                                  : 'https://placeholder.com/image.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
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
                                                  onPressed: () {
                                                    setState(() {
                                                      if (favoriteIndexes
                                                          .contains(index)) {
                                                        favoriteIndexes.remove(
                                                          index,
                                                        );
                                                      } else {
                                                        favoriteIndexes.add(
                                                          index,
                                                        );
                                                      }
                                                    });
                                                  },
                                                  icon: Icon(
                                                    favoriteIndexes.contains(
                                                          index,
                                                        )
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    color:
                                                        favoriteIndexes
                                                            .contains(index)
                                                        ? Colors.red
                                                        : Colors.black,
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
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 4),
                                          Text(
                                            '\$${product.price.toString()}',
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
                              ),
                            ],
                          );
                        },

                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 12);
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  const Text(
                    'New In',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.primaryColors,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.5),
              SizedBox(
                height: 281,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: 159,
                          height: 281,
                          decoration: BoxDecoration(
                            color: AppColor.secondaryColors,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 159,
                                height: 220,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,

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
                              const Row(
                                children: [
                                  SizedBox(width: 4),
                                  Text(
                                    "Men's Harrington Jacket",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  SizedBox(width: 4),
                                  Text(
                                    "\$148.00",
                                    style: TextStyle(
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
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 12);
                  },
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
