import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/core/constants/images/app_images.dart';
import 'package:scot/features/cart/cubit/add_cart_cubit/add_to_Bag_cubit.dart';
import 'package:scot/features/cart/cubit/add_cart_cubit/add_to_Bag_state.dart';
import 'package:scot/features/cart/model/products_model.dart';
import 'package:scot/features/cart/presentation/page/cart_page.dart';

class InsideProductInforamtions extends StatefulWidget {
  const InsideProductInforamtions({super.key, required this.product});
  final ProductModel product;
  @override
  State<InsideProductInforamtions> createState() =>
      _InsideProductInforamtionsState();
}

class _InsideProductInforamtionsState extends State<InsideProductInforamtions> {
  String? selectedsize = "S";
  String? selectedcolor = "Red";

  int son = 1;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                            image: NetworkImage(widget.product.images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: widget.product.images.length,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        widget.product.name,
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        " \$${widget.product.price.toString()}",
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      sizeBotomsheet(context);
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
                            Icon(Icons.keyboard_arrow_down_rounded, size: 34),
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
                      colorBotomsheet(context);
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
                            Icon(Icons.keyboard_arrow_down_rounded, size: 34),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          Image.asset(AppImages.stars, width: 80, height: 16),
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
      ),
      bottomNavigationBar: BlocListener<AddToBagCubit, AddtoBagState>(
        listener: (context, state) {
          if (state is AddtoBagLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('hoz sabr qoshilvot')),
            );
          } else if (state is AddtoBagError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('ashibka: ${state.message}'),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('qoshildi nado budet'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CartPage(),),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 30,
            top: 10,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              if (selectedsize != null && selectedcolor != null) {
                context.read<AddToBagCubit>().addToBag(
                  productId: widget.product.id,
                  color: selectedcolor!,
                  size: selectedsize!,
                  quantity: son,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('razmerini tanla OOOUU !!!!!!!!!!'),
                  ),
                );
              }
            },
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: const Color(0xFF8E6CEF),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.product.price * son}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
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
      ),
    );
  }

  List<String> colorOptions = ['Orange', 'Black', 'Red', 'Yellow', 'Blue'];
  Future<dynamic> colorBotomsheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setBotSheetState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setBotSheetState(() {
                            selectedcolor = null;
                          });
                        },
                        child: const Text(
                          'Clear',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const Text(
                        'Color',
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
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: colorOptions.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final bool isSelected =
                          selectedcolor == colorOptions[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          setBotSheetState(() {
                            selectedcolor = colorOptions[index];
                          });
                        },
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColor.primaryColors
                                : AppColor.secondaryColors,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                colorOptions[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              if (isSelected)
                                const Icon(Icons.check, color: Colors.white),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<String> sizeOptions = ['S', 'M', 'L', 'XL', '2XL'];

  Future<dynamic> sizeBotomsheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setBotSheetState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setBotSheetState(() {
                            selectedsize = null;
                          });
                        },
                        child: const Text(
                          'Clear',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
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
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sizeOptions.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final bool isSelected =
                          selectedsize == sizeOptions[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          setBotSheetState(() {
                            selectedsize = sizeOptions[index];
                          });
                        },
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColor.primaryColors
                                : AppColor.secondaryColors,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                sizeOptions[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              if (isSelected)
                                const Icon(Icons.check, color: Colors.white),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
