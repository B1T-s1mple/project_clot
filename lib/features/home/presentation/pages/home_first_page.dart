import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/cart/presentation/page/inside_product_inforamtions.dart';
import 'package:scot/features/filter/presentation/pages/filter_page.dart';
import 'package:scot/features/home/presentation/pages/home_categories_page.dart';

class HomeFirstPage extends StatefulWidget {
  const HomeFirstPage({super.key});

  @override
  State<HomeFirstPage> createState() => _HomeFirstPageState();
}

class _HomeFirstPageState extends State<HomeFirstPage> {
  String? yosh;
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
            CircleAvatar(radius: 20, backgroundColor: Colors.amberAccent),
            DropdownButton<String>(
              dropdownColor: AppColor.secondaryColors,
              focusColor: AppColor.secondaryColors,
              borderRadius: BorderRadius.circular(20),
              underline: const SizedBox(),
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              value: yosh,
              hint: Text('gender'),
              items: [
                DropdownMenuItem(value: 'Men', child: Text('Men')),
                DropdownMenuItem(value: 'Woman', child: Text('Woman')),
              ],
              onChanged: (value) {
                setState(() {
                  yosh = value;
                });
              },
            ),
            CircleAvatar(
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
                    MaterialPageRoute(builder: (context) => FilterPage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColor.secondaryColors,
                  ),
                  child: Row(
                    spacing: 15,
                    children: [
                      SizedBox(width: 5),
                      Icon(Icons.search),
                      Text('Search'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.5),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeCategoriesPage(),
                        ),
                      );
                    },
                    child: Text(
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
              SizedBox(height: 16),
              SizedBox(
                height: 83,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(radius: 28, backgroundColor: Colors.grey),
                        SizedBox(height: 7),
                        Text(
                          'Hoodies',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 22.5);
                  },
                ),
              ),
              SizedBox(height: 16),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Top Selling',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
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
              SizedBox(height: 16.5),

              SizedBox(
                height: 281,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InsideProductInforamtions(),
                              ),
                            );
                          },
                          child: Container(
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

                                    borderRadius: BorderRadius.only(
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
                                                if (favoriteIndexes.contains(
                                                  index,
                                                )) {
                                                  favoriteIndexes.remove(index);
                                                } else {
                                                  favoriteIndexes.add(index);
                                                }
                                              });
                                            },
                                            icon: Icon(
                                              favoriteIndexes.contains(index)
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color:
                                                  favoriteIndexes.contains(
                                                    index,
                                                  )
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
                                    SizedBox(width: 4),
                                    Text(
                                      "Men's Harrington Jacket",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                Row(
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
                        ),
                      ],
                    );
                  },

                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12);
                  },
                  itemCount: 3,
                ),
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'New In',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.primaryColors,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
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
              SizedBox(height: 16.5),
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

                                  borderRadius: BorderRadius.only(
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
                                          icon: Icon(
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
                                  SizedBox(width: 4),
                                  Text(
                                    "Men's Harrington Jacket",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
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
                    return SizedBox(width: 12);
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
