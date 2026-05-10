import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/home/presentation/notifications_prders/inside_order.dart';

class OrdersSeconHaveInfo extends StatefulWidget {
  const OrdersSeconHaveInfo({super.key});

  @override
  State<OrdersSeconHaveInfo> createState() => _OrdersSeconHaveInfoState();
}

class _OrdersSeconHaveInfoState extends State<OrdersSeconHaveInfo> {
  // ignore: non_constant_identifier_names
  final List<String> ordre_page_categoria = [
    "Processing",
    "Shipped",
    "Delivered",
    "Returned",
    "Cancelled",
  ];
  final List<Map<String, dynamic>> orders = [
    {"orderId": "#456765", "itemCount": 4},
    {"orderId": "#454569", "itemCount": 2},
    {"orderId": "#454809", "itemCount": 1},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Orders',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          SizedBox(
            height: 35,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: .horizontal,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    animationDuration: null,
                    shadowColor: null,
                    backgroundColor: AppColor.primaryColors,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('${ordre_page_categoria[index]}'),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 13);
              },
              itemCount: ordre_page_categoria.length,
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            InsideOrder(id: orders[index]['orderId']),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: 342,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.secondaryColors,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Icon(Icons.receipt_long_sharp, size: 27),
                        ),
                        Column(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              "Order ${orders[index]['orderId']}",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${orders[index]['itemCount']} items",
                              style: TextStyle(
                                color: Color(0xFF27272780),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 15);
              },
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
