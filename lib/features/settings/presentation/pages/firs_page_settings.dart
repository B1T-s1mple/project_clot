import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/auth/presentation/page/sign_page.dart';
import 'package:scot/features/settings/presentation/pages/adress.dart';
import 'package:scot/features/settings/presentation/pages/payment.dart';
import 'package:scot/features/settings/presentation/pages/wishlist.dart';

class FirsPageSettings extends StatefulWidget {
  const FirsPageSettings({super.key});

  @override
  State<FirsPageSettings> createState() => _FirsPageSettingsState();
}

class _FirsPageSettingsState extends State<FirsPageSettings> {
  final List<String> texts = [
    "Address",
    "Wishlist",
    "Payment",
    "Help",
    "Support",
  ];
  final List<Widget> pages = [Adress(), Wishlist(), Payment()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,

        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColor.secondaryColors,
                ),
              ],
            ),
            SizedBox(height: 38),
            Container(
              height: 92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.secondaryColors,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          'Gilbert Jones',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Glbertjones001@gmail.com',
                          style: TextStyle(
                            color: Color(0xFF27272780).withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          '121-224-7890',
                          style: TextStyle(
                            color: Color(0xFF27272780).withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.primaryColors,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 26),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(34567),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pages[index]),
                    );
                  },
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.secondaryColors,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text('${texts[index]}'),
                          Icon(Icons.keyboard_arrow_right, size: 30),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
              itemCount: texts.length,
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: .center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignPage()),
                    );
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
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
