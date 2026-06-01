import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class NotificationSecon extends StatefulWidget {
  const NotificationSecon({super.key});

  @override
  State<NotificationSecon> createState() => _NotificationSeconState();
}

class _NotificationSeconState extends State<NotificationSecon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Notifications',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  width: 342,
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.secondaryColors,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [

                        Icon(Icons.mark_email_unread_sharp),
                         Spacer(),
                        Text(
                          'Gilbert, you placed and order check your order\n history for full details',
                          style: TextStyle(fontSize: 14),
                        ),
                       
                         Spacer(),

                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
