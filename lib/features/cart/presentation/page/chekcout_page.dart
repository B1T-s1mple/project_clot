import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/cart/presentation/page/ordered_page.dart';

class ChekcoutPage extends StatefulWidget {
  const ChekcoutPage({super.key});

  @override
  State<ChekcoutPage> createState() => _ChekcoutPageState();
}

class _ChekcoutPageState extends State<ChekcoutPage> {
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
          'Checkout',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 32),
            Expanded(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.secondaryColors,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: .center,
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  'Shipping Address',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withValues(alpha: 0.5),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Add Shipping Address',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.secondaryColors,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: .center,
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  'Payment Method',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withValues(alpha: 0.5),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Add Payment Methodr',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
              MaterialPageRoute(builder: (context) => OrderedPage()),
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
                  '\$208',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  'Place order',
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
}
