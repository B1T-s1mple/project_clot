import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class Three extends StatefulWidget {
  const Three({super.key});

  @override
  State<Three> createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  // bool con1 = true;
  // bool con2 = false;
  // bool con3 = false;
  // bool con4 = false;
  String selectedSortBy = "Recommended";
  String selectedGender = "Men";
  String selectedDeals = 'on Sale';
  String selectedPrice = "Min";

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
                    dealsBotomsheet(context);
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
                    priceBotomsheet(context);
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
                    sortBotomsheet(context);
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
                    genderBotomsheet(context);
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

  List<String> sortOptions = [
    'Recommended',
    'Newest',
    'Lowest - Highest Price',
    'Highest - Lowest Price',
  ];

  Future<dynamic> sortBotomsheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                itemCount: sortOptions.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final bool isSelected = selectedSortBy == sortOptions[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(() {
                        selectedSortBy = sortOptions[index];
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
                            sortOptions[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
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
  }

  List<String> genderOptions = ['Men', 'Women', 'Kids'];
  Future<dynamic> genderBotomsheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                itemCount: genderOptions.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final bool isSelected =
                      selectedGender == genderOptions[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(() {
                        selectedGender = genderOptions[index];
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
                            genderOptions[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
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
  }

  List<String> dealsOptions = ['On sale', 'Free Shipping Eligible'];

  Future<dynamic> dealsBotomsheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                itemCount: dealsOptions.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final bool isSelected = selectedDeals == dealsOptions[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(() {
                        selectedDeals = dealsOptions[index];
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
                            genderOptions[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
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
  
  }
  List<String> priceOptions = ['Min', 'Max'];

  Future<dynamic> priceBotomsheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                itemCount: priceOptions.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final bool isSelected = selectedPrice == priceOptions[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(() {
                        selectedPrice = priceOptions[index];
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
                            priceOptions[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
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
  }
}
