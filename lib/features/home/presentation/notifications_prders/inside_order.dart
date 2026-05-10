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
          icon: Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Order ${widget.id}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 41),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  child: Icon(Icons.check, size: 15),
                  backgroundColor: Colors.deepPurpleAccent.withValues(
                    alpha: 0.3,
                  ),
                  foregroundColor: Colors.white,
                ),
                SizedBox(width: 12),
                Text(
                  'Delivered',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF27272780).withValues(alpha: 0.5),
                  ),
                ),
                Spacer(),
                Text(
                  '28 May',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF27272780).withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  child: Icon(Icons.check, size: 15),
                  backgroundColor: AppColor.primaryColors,
                  foregroundColor: Colors.white,
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
            SizedBox(height: 50),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  child: Icon(Icons.check, size: 15),
                  backgroundColor: AppColor.primaryColors,
                  foregroundColor: Colors.white,
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
            SizedBox(height: 50),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  child: Icon(Icons.check, size: 15),
                  backgroundColor: AppColor.primaryColors,
                  foregroundColor: Colors.white,
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
            SizedBox(height: 40),
            Row(
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
                        Icon(Icons.receipt_long_outlined),
                        SizedBox(width: 20),
                        Text('4 items'),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
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
            SizedBox(height: 40),
            Row(
              children: [
                Text(
                  'Shipping details',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 14,),
            Row(
              children: [
                Container(
                  width: 452,

                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.secondaryColors,
                  ),
                  child: Row(
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
