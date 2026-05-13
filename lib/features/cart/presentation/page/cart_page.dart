import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/cart/presentation/page/chekcout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 24),

        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColor.secondaryColors,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Remove All',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.secondaryColors,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Container(width: 64, height: 64, color: Colors.grey),
                          SizedBox(width: 12),
                          Column(
                            mainAxisAlignment: .center,
                            crossAxisAlignment: .start,
                            children: [
                              Row(
                                children: [
                                  Text("Men's Harrington Jacket"),
                                  SizedBox(width: 178),
                                  Text(
                                    '\$148',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Size',
                                        style: TextStyle(
                                          color: Colors.black.withValues(
                                            alpha: 0.5,
                                          ),
                                        ),
                                      ),
                                      Text(' - M'),
                                    ],
                                  ),
                                  SizedBox(width: 16),
                                  Row(
                                    children: [
                                      Text(
                                        'Color',
                                        style: TextStyle(
                                          color: Colors.black.withValues(
                                            alpha: 0.5,
                                          ),
                                        ),
                                      ),
                                      Text(' - Lemon'),
                                    ],
                                  ),
                                  SizedBox(width: 149),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor:
                                              AppColor.primaryColors,
                                          foregroundColor: Colors.white,
                                          child: Icon(Icons.add, size: 15),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      InkWell(
                                        onTap: () {},
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor:
                                              AppColor.primaryColors,
                                          foregroundColor: Colors.white,
                                          child: Icon(Icons.remove, size: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: 2,
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,

              children: [
                Text(
                  'Suptotal',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
                Text(
                  '\$200',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Shipping Cost',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
                Text(
                  '\$8.00',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,

              children: [
                Text(
                  'Tax',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
                Text(
                  '\$0.00',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,

              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
                Text(
                  '\$208',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 32),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {},
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.secondaryColors,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.discount_outlined,
                        color: Colors.lightGreenAccent,
                      ),
                      SizedBox(width: 13),
                      Text(
                        'Enter Coupon Code',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.primaryColors,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.arrow_forward_ios_rounded, size: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
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
              MaterialPageRoute(builder: (context) => ChekcoutPage()),
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
              mainAxisAlignment: .center,
              children: [
                Text(
                  'Chekcout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
