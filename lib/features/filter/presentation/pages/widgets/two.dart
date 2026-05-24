import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/home/presentation/pages/home_products_page.dart';

// ignore: camel_case_types
class category extends StatelessWidget {
  const category({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 34),
          const Row(
            children: [
              Text(
                'Shop by Categories',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeProductsPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 342,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColors,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(children: [SizedBox(width: 20), Text('Hodies')]),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
