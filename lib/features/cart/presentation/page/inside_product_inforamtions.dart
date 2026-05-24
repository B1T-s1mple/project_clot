import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/core/constants/images/app_images.dart';
import 'package:scot/features/cart/cubit/product_cubit_cubit.dart';
import 'package:scot/features/cart/cubit/product_cubit_state.dart';
import 'package:scot/features/cart/model/products_model.dart';
import 'package:scot/features/cart/presentation/page/cart_page.dart';

class InsideProductInforamtions extends StatefulWidget {
  const InsideProductInforamtions({super.key});

  @override
  State<InsideProductInforamtions> createState() =>
      _InsideProductInforamtionsState();
}

class _InsideProductInforamtionsState extends State<InsideProductInforamtions> {
  bool con1 = true;
  bool con2 = false;
  bool con3 = false;
  bool con4 = false;
  bool con5 = false;
  bool con1_2 = true;
  bool con2_2 = false;
  bool con3_2 = false;
  bool con4_2 = false;
  bool con5_2 = false;
  int son = 1;
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const CircularProgressIndicator.adaptive();
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else if (state is ProductsLoaded) {
            final ProductModel product = state.products[1];
            print(product);
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 85,
                  backgroundColor: Colors.white,
                  centerTitle: false,
                  titleSpacing: 24,

                  title: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColor.secondaryColors,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  actions: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColor.secondaryColors,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 281,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 161,
                              height: 248,
                              decoration: BoxDecoration(
                                color: AppColor.secondaryColors,

                                image: DecorationImage(
                                  image: NetworkImage(product.images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 10);
                          },
                          itemCount: product.images.length,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              " \$${product.price.toString()}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColor.primaryColors,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 33),
                      Padding(
                        // ignore: prefer_const_constructors
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            botomsheet(context);
                          },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColor.secondaryColors,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text('Size', style: TextStyle(fontSize: 16)),
                                  Spacer(),
                                  Text(
                                    'S',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: 29),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 34,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            botomsheet_2(context);
                          },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColor.secondaryColors,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text('Color', style: TextStyle(fontSize: 16)),
                                  Spacer(),
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Color(0xFFB3B68B),
                                  ),
                                  SizedBox(width: 29),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 34,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {},
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColor.secondaryColors,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'Quantity',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        son++;
                                      });
                                    },
                                    child: const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: AppColor.primaryColors,
                                      foregroundColor: Colors.white,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  const SizedBox(width: 23),
                                  Text(
                                    '$son',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 23),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (son > 1) {
                                          son--;
                                        }
                                      });
                                    },
                                    child: const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: AppColor.primaryColors,
                                      foregroundColor: Colors.white,
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 26),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                          "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              'Shipping & Returns',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              'Free standard shipping and free 60-day returns',
                              style: TextStyle(
                                color: Colors.black.withValues(alpha: 0.5),

                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              'Reviews',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              '4.5 Ratings',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              '213 Reviews',
                              style: TextStyle(
                                color: Colors.black.withValues(alpha: 0.5),

                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
                  sliver: SliverList.separated(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 128,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColor.secondaryColors,
                                ),
                                const SizedBox(width: 20),
                                const Text(
                                  'Alex Morgan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  AppImages.stars,
                                  width: 80,
                                  height: 16,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black.withValues(alpha: 0.5),
                              ),
                              "Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive\naccessories.",
                            ),
                            const SizedBox(height: 4),
                            const Row(
                              children: [
                                Text(
                                  '12days ago',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 12);
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 30,
          top: 10,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
          child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: const Color(0xFF8E6CEF),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$148',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'Add to Bag',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> botomsheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Clear', style: TextStyle(fontSize: 16)),
                      const Text(
                        'Size',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.check),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1 = true;
                        con2 = false;
                        con3 = false;
                        con4 = false;
                        con5 = false;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con1
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'S',
                            style: TextStyle(
                              color: con1 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con1)
                            const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1 = false;
                        con2 = true;
                        con3 = false;
                        con4 = false;
                        con5 = false;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con2
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'M',
                            style: TextStyle(
                              color: con2 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con2)
                            const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1 = false;
                        con2 = false;
                        con3 = true;
                        con4 = false;
                        con5 = false;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con3
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'L',
                            style: TextStyle(
                              color: con3 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con3)
                            const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1 = false;
                        con2 = false;
                        con3 = false;
                        con4 = true;
                        con5 = false;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con4
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'XL',
                            style: TextStyle(
                              color: con4 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con4)
                            const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1 = false;
                        con2 = false;
                        con3 = false;
                        con4 = false;
                        con5 = true;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con5
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2XL',
                            style: TextStyle(
                              color: con5 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con5)
                            const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 2.8),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<dynamic> botomsheet_2(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Clear', style: TextStyle(fontSize: 16)),
                      const Text(
                        'Sort by',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.check),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1_2 = true;
                        con2_2 = false;
                        con3_2 = false;
                        con4_2 = false;
                        con5_2 = false;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con1_2
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Orange',
                            style: TextStyle(
                              color: con1_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          const CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.orange,
                          ),
                          if (con1_2)
                            const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1_2 = false;
                        con2_2 = true;
                        con3_2 = false;
                        con4_2 = false;
                        con5_2 = false;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con2_2
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Black',
                            style: TextStyle(
                              color: con2_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          const CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.black,
                          ),
                          if (con2_2)
                            const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1_2 = false;
                        con2_2 = false;
                        con3_2 = true;
                        con4_2 = false;
                        con5_2 = false;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con3_2
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Red',
                            style: TextStyle(
                              color: con3_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          const CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.red,
                          ),

                          if (con3_2)
                            const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1_2 = false;
                        con2_2 = false;
                        con3_2 = false;
                        con4_2 = true;
                        con5_2 = false;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con4_2
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Yellow',
                            style: TextStyle(
                              color: con4_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          const CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.yellow,
                          ),
                          if (con4_2)
                            const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1_2 = false;
                        con2_2 = false;
                        con3_2 = false;
                        con4_2 = false;
                        con5_2 = true;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con5_2
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Red',
                            style: TextStyle(
                              color: con5_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          const CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.red,
                          ),

                          if (con5_2)
                            const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 2.8),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
