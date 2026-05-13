import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/core/constants/images/app_images.dart';
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
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            actions: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.secondaryColors,
                ),
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              ),
              SizedBox(width: 24),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 281,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 161,
                        height: 248,
                        color: AppColor.secondaryColors,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10);
                    },
                    itemCount: 3,
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "Men's Harrington Jacket",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "\$148",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.primaryColors,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 33),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                SizedBox(height: 12),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                SizedBox(height: 12),
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
                            Text('Quantity', style: TextStyle(fontSize: 16)),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  son++;
                                });
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColor.primaryColors,
                                foregroundColor: Colors.white,
                                child: Icon(Icons.add),
                              ),
                            ),
                            SizedBox(width: 23),
                            Text(
                              '$son',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 23),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (son > 1) {
                                    son--;
                                  }
                                });
                              },
                              child: CircleAvatar(
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
                SizedBox(height: 26),
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
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                SizedBox(height: 12),
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
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                SizedBox(height: 12),
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
                SizedBox(height: 24),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            sliver: SliverList.separated(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  height: 128,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColor.secondaryColors,
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Alex Morgan',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                          Spacer(),
                          Image.asset(AppImages.stars, width: 80, height: 16),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                        "Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive\naccessories.",
                      ),
                      SizedBox(height: 4),
                      Row(
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
                return SizedBox(height: 12);
              },
            ),
          ),
        ],
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
              MaterialPageRoute(builder: (context) => CartPage()),
            );
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
                  '\$148',
                  style: TextStyle(
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
    );
  }

  Future<dynamic> botomsheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Clear', style: TextStyle(fontSize: 16)),
                      Text(
                        'Sort by',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.check),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                  SizedBox(height: 12),

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'M',
                            style: TextStyle(
                              color: con2 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con2) Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'L',
                            style: TextStyle(
                              color: con3 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con3) Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'XL',
                            style: TextStyle(
                              color: con4 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con4) Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2XL',
                            style: TextStyle(
                              color: con5 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con5) Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.8),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Clear', style: TextStyle(fontSize: 16)),
                      Text(
                        'Sort by',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.check),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Orange',
                            style: TextStyle(
                              color: con1_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.orange,
                          ),
                          if (con1_2)
                            const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Black',
                            style: TextStyle(
                              color: con2_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.black,
                          ),
                          if (con2_2) Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Red',
                            style: TextStyle(
                              color: con3_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          CircleAvatar(radius: 8, backgroundColor: Colors.red),

                          if (con3_2) Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Yellow',
                            style: TextStyle(
                              color: con4_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.yellow,
                          ),
                          if (con4_2) Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Red',
                            style: TextStyle(
                              color: con5_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          CircleAvatar(radius: 8, backgroundColor: Colors.red),

                          if (con5_2) Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.8),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
