import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/core/constants/images/app_images.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(AppImages.search),
            const SizedBox(height: 24),
            const SizedBox(
              width: 342,
              child: Text(
                textAlign: TextAlign.center,
                "Sorry, we couldn't find any matching result for your Search.",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {},
              child: Container(
                width: 185,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColor.primaryColors,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Center(
                  child: Text(
                    'Explore Categories',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
