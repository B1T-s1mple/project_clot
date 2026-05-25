import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/home/cubit/category_cubit_cubit.dart';
import 'package:scot/features/home/cubit/category_cubit_state.dart';
import 'package:scot/features/home/presentation/pages/home_products_page.dart';

class HomeCategoriesPage extends StatefulWidget {
  const HomeCategoriesPage({super.key});

  @override
  State<HomeCategoriesPage> createState() => _HomeCategoriesPageState();
}

class _HomeCategoriesPageState extends State<HomeCategoriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubitCubit>().getProducts();
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
          children: [
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
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CategoryError) {
                    return Center(child: Text(state.message));
                  } else if (state is CategoryLoaded) {
                    final categories = state.categorise;

                    if (categories.isEmpty) {
                      return const Center(child: Text("Kategoriya y'O"));
                    }

                    return ListView.separated(
                      itemCount: categories.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 8);
                      },
                      itemBuilder: (context, index) {
                        final category = categories[index];

                        return InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            setState(() {
                                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomeProductsPage(category_id: index + 1),
                              ),
                            );
                            });
                            print(index);
                        
                          },
                          child: Container(
                            width: 342,
                            height: 64,
                            decoration: BoxDecoration(
                              color: AppColor.secondaryColors,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              spacing: 20,
                              children: [
                                const SizedBox(width: 20),
                                Image(
                                  image: NetworkImage(category.images),
                                  width: 40,
                                  height: 40,
                                ),
                                Text(category.name),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
