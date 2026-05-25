import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class Three extends StatefulWidget {
  const Three({super.key});

  @override
  State<Three> createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  bool con1 = true;
  bool con2 = false;
  bool con3 = false;
  bool con4 = false;
  bool con1_2 = true;
  bool con2_2 = false;
  bool con3_2 = false;
  bool con1_3 = true;
  bool con2_3 = false;
  bool con1_4 = false;
  bool con2_4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              spacing: 15,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(9876543234567),
                  onTap: () {},
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColors,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Icon(Icons.filter_alt_outlined, color: Colors.white),
                          Text('2', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(9876543234567),
                  onTap: () {
                    botomsheet_3(context);
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColors,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [Text('On Sale', style: TextStyle())],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(9876543234567),
                  onTap: () {
                    botomsheet_4(context);
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColors,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Text('Price', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(9876543234567),
                  onTap: () {
                    botomsheet(context);
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColors,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Text('Sort  by', style: TextStyle()),
                          Icon(Icons.keyboard_arrow_down_sharp),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(9876543234567),
                  onTap: () {
                    botomsheet_2(context);
                  },

                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColors,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Text('Men', style: TextStyle(color: Colors.white)),
                          Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(children: [Text('53 Results Found')]),
            const SizedBox(height: 16),

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  mainAxisExtent: 281,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
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
              ),
            ),
          ],
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
                        con1 = !con1;
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
                            'Recommended',
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
                        con2 = !con2;
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
                            'Newest',
                            style: TextStyle(
                              color: con2 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con2) const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con3 = !con3;
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
                            'Lowest - Highest Price',
                            style: TextStyle(
                              color: con3 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con3) const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con4 = !con4;
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
                            'Highest - Lowest Price',
                            style: TextStyle(
                              color: con4 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con4) const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
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
                        'Gender',
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
                            'Men',
                            style: TextStyle(
                              color: con1_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con1_2) const Icon(Icons.check, color: Colors.white),
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
                            'Women',
                            style: TextStyle(
                              color: con2_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con2_2) const Icon(Icons.check, color: Colors.white),
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
                            'kids',
                            style: TextStyle(
                              color: con3_2 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con3_2) const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
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

  Future<dynamic> botomsheet_3(BuildContext context) {
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
                        'Deals',
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
                        con1_3 = true;
                        con2_3 = false;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con1_3
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'On sale',
                            style: TextStyle(
                              color: con1_3 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con1_3) const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1_3 = false;
                        con2_3 = true;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con2_3
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Free Shipping Eligible',
                            style: TextStyle(
                              color: con2_3 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con2_3) const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
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

  Future<dynamic> botomsheet_4(BuildContext context) {
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
                        'Price',
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
                        con1_4 = true;
                        con2_4 = false;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con1_4
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Min',
                            style: TextStyle(
                              color: con1_4 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con1_4) const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setModalState(() {
                        con1_4 = false;
                        con2_4 = true;
                      });
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: con2_4
                            ? AppColor.primaryColors
                            : AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Max',
                            style: TextStyle(
                              color: con2_4 ? Colors.white : Colors.black,
                            ),
                          ),
                          if (con2_4) const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
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
