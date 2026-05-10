import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/home/presentation/notifications_prders/notification_secon.dart';
import 'package:scot/features/home/presentation/notifications_prders/orders_secon_have_info.dart';
import 'package:scot/features/home/presentation/pages/home_first_page.dart';
import 'package:scot/features/settings/presentation/pages/firs_page_settings.dart';
// Importlaringiz qoladi...

class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  int _currentIndex = 0;

  final List<Widget> pages = [
     HomeFirstPage(),
     NotificationSecon(),
     OrdersSeconHaveInfo(),
     FirsPageSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        
        selectedItemColor: AppColor.primaryColors,
        unselectedItemColor: const Color(0x80272727), 
        
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10, 

        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}