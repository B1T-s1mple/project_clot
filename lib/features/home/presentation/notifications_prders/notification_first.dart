import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/core/constants/images/app_images.dart';
import 'package:scot/features/home/presentation/notifications_prders/notification_secon.dart';

class NotificationFirst extends StatefulWidget {
  const NotificationFirst({super.key});

  @override
  State<NotificationFirst> createState() => _NotificationFirst();
}

class _NotificationFirst extends State<NotificationFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
           
            ],
          ),
          Image.asset(AppImages.bell, width: 100, height: 100),
          SizedBox(height: 24),
          Text(
            'No Notification yet',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 40),
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationSecon()),
              );
            },
            child: Container(
              width: 159,
              height: 52,
              decoration: BoxDecoration(
                color: AppColor.primaryColors,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  'Explore Categories',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
