import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/core/constants/images/app_images.dart';
import 'package:scot/features/home/presentation/notifications_prders/orders_secon_have_info.dart';

class OrderedPage extends StatefulWidget {
  const OrderedPage({super.key});

  @override
  State<OrderedPage> createState() => _OrderedPageState();
}

class _OrderedPageState extends State<OrderedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColors,
      body: Column(
        children: [
          Spacer(),
          Image.asset(AppImages.pc, width: 317, height: 252),
          Spacer(),
          Container(
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                Column(
                  crossAxisAlignment: .center,
                  children: [
                    SizedBox(height: 40,),
                    Text(
                      textAlign: TextAlign.center,
                      'Order Placed\nSuccessfully',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ), SizedBox(height: 25,),
                    Text("You will recieve an email confirmation"),
                     SizedBox(height: 78,),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrdersSeconHaveInfo(),
                          ),
                        );
                      },
                      child: Container(
                        height: 52,
                        width: 430,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8E6CEF),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'See Order details',
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
