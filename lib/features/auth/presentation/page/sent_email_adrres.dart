import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/core/constants/images/app_images.dart';
import 'package:scot/features/auth/presentation/page/xz_page.dart';

class SentEmailAdrres extends StatefulWidget {
  const SentEmailAdrres({super.key});

  @override
  State<SentEmailAdrres> createState() => _SentEmailAdrresState();
}

class _SentEmailAdrresState extends State<SentEmailAdrres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: .center,
        children: [
          Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.sentEmail, width: 100, height: 100),
              SizedBox(height: 24),
              SizedBox(
                width: 342,
                child: Text(
                  textAlign: TextAlign.center,
                  'We Sent you an Email to reset your password.',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => XzPage()),
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
                      'Return to Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
