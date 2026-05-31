import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class InsideOrder extends StatefulWidget {
  final String id;
  const InsideOrder({super.key, required this.id});

  @override
  State<InsideOrder> createState() => _InsideOrderState();
}

class _InsideOrderState extends State<InsideOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColor.secondaryColors,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Order ${widget.id}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 41),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.deepPurpleAccent.withValues(
                    alpha: 0.3,
                  ),
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.check, size: 15),
                ),
                const SizedBox(width: 12),
                Text(
                  'Delivered',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color(0xFF27272780).withValues(alpha: 0.5),
                  ),
                ),
                const Spacer(),
                Text(
                  '28 May',
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF27272780).withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColor.primaryColors,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.check, size: 15),
                ),
                SizedBox(width: 12),
                Text(
                  'Shipped',
                  style: TextStyle(fontSize: 16, color: Color(0xFF272727)),
                ),
                Spacer(),
                Text(
                  '28 May',
                  style: TextStyle(fontSize: 12, color: Color(0xFF272727)),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColor.primaryColors,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.check, size: 15),
                ),
                SizedBox(width: 12),
                Text(
                  'Order Confirmed ',
                  style: TextStyle(fontSize: 16, color: Color(0xFF272727)),
                ),
                Spacer(),
                Text(
                  '28 May',
                  style: TextStyle(fontSize: 12, color: Color(0xFF272727)),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColor.primaryColors,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.check, size: 15),
                ),
                SizedBox(width: 12),
                Text(
                  'Order Placed',
                  style: TextStyle(fontSize: 16, color: Color(0xFF272727)),
                ),
                Spacer(),
                Text(
                  '28 May',
                  style: TextStyle(fontSize: 12, color: Color(0xFF272727)),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Row(
              children: [
                Text(
                  'Order items',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 72,
                  width: 452,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.secondaryColors,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Icon(Icons.receipt_long_outlined),
                        const SizedBox(width: 20),
                        const Text('4 items'),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View All',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColor.primaryColors,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Row(
              children: [
                Text(
                  'Shipping details',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 14,),
            Row(
              children: [
                Container(
                  width: 452,

                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.secondaryColors,
                  ),
                  child: const Row(
                    mainAxisAlignment: .start,
                    children: [
                      SizedBox(width: 11,),
                      Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            '2715 Ash Dr. San Jose, South Dakota 83475',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF272727),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '121-224-7890',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF272727),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
